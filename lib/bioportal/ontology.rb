require "forwardable"

module Bioportal
  class Ontology
    attr_accessor :id, :ontology_id, :description, :label, :abbreviation, :bio_portal, :properties, :properties_by_domain
    
    def initialize(id, bio_portal, fill = true)
      @id = id
      @bio_portal = bio_portal
      @filled = false
      @properties = nil
      @properties_by_domain = {}
      if fill
        fillme
      end
    end
    
    def fillme
      @filled = true
      doc = @bio_portal.get_page("ontologies/#{@id}")
      if doc
        ontology = doc.xpath("success/data/ontologyBean")
        @ontology_id = ontology.xpath("ontologyId").text
        @description = ontology.xpath("description").text
        @label = ontology.xpath("displayLabel").text
        @abbreviation = ontology.xpath("abbreviation").text
      end
    end
    
    def exists?
      if !@filled
        fillme
      end
      if @label.nil?
        return false
      else
        return true
      end
    end
    
    def get_term_xml(term_id)
      doc = bio_portal.get_page("concepts/#{@id}/#{term_id}")
      if doc
        return doc.xpath("success/data/classBean")
      else
        return ""
      end
    end
    
    def get_term(term_id)
      return Term.new(:xml => get_term_xml(term_id), :ontology => self)
    end
    
    def get_terms
      doc = bio_portal.get_page("concepts/#{@id}/root")
      return_value = []
      # get relation entry that has a string of "SubClass"
      if doc
        sub_classes = doc.xpath("success/data/classBean/relations/entry").reject {|e| e.xpath('string').text !~ /SubClass/}.first
        if sub_classes
          sub_classes.xpath('list/classBean').each do |term|
            t = Bioportal::Term.new(:xml => term, :ontology => self)
            return_value.push(t)
          end
        end
      end
      return return_value
    end
    
    def get_properties_for_domain(domain_id)
      if @properies.nil?
        get_properties
      end
      return properties_by_domain[domain_id]
    end
    
    def get_properties
      if @properties.nil?
        @properties = []
        doc = bio_portal.get_page("ontologies/properties/#{@id}")
        # get relation entry that has a string of "SubClass"
        if doc
          props = doc.xpath("success/data/list/propertyBean")
          if props
            props.each do |property|
              p = Bioportal::Property.new(:xml => property, :ontology => self)
              @properties.push(p)
              if p.domain and p.domain.class == Term
                if !@properties_by_domain[p.domain.id]
                  @properties_by_domain[p.domain.id] = []
                end
                @properties_by_domain[p.domain.id].push(p)
              end
            end
          end
        end
      end
      return @properties
    end
  end
end