module Bioportal
  class Term
    attr_accessor :id, :full_id, :label, :definition, :ontology, :child_count, 
          :relations, :type, :comment, :subset, :xref, :is_a, :r_is_a, :super_class, 
          :alt_id, :disjoint_from, :r_disjoint_from, :part_of,
          :synonyms, :regulates, :filled, :filled_light, :parents, :properties, :children
          
    def initialize(params = nil)
      @filled = false
      @parents = nil
      if params
        if params[:ontology]
          @ontology = params[:ontology]
        end
        if params[:id]
          @id = params[:id]
        end
        if params[:xml]
          fill_from_xml(params[:xml])
        end
        if params[:fill_light]
          doc = ontology.bio_portal.get_page("concepts/#{@ontology.id}/#{@id}", {:light => 1})
          if doc
            fill_from_xml(doc.xpath("success/data/classBean"))
          end
        end
      end
    end
    
    def fill_from_xml(xml)
      @filled = true
      @filled_light = true
      @id = xml.xpath("id").text
      @full_id = xml.xpath("fullId").text
      @label = xml.xpath("label").text
      @definition = xml.xpath("definitions/string").text
      @child_count = 0
      @relations = {}
      @is_a = []
      @r_is_a = []
      @disjoint_from = []
      @r_disjoint_from = []
      @super_class = []
      @part_of = []
      @subset = []
      @synonyms = {}
      @regulates = {}
      @children = []
      xml.xpath("relations/entry").each do |entry|
        type = entry.xpath("string").text
        if type =~ /ChildCount/
          @child_count = entry.xpath("int").text.to_i
        elsif type =~ /comment/i
          @comment = entry.xpath("list/string").collect {|x| x.text}
        elsif type =~ /broad synonym/i
          @synonyms['broad'] = entry.xpath("list/string").collect {|x| x.text}
        elsif type =~ /exact synonym/i
          @synonyms['exact'] = entry.xpath("list/string").collect {|x| x.text}
        elsif type =~ /narrow synonym/i
          @synonyms['narrow'] = entry.xpath("list/string").collect {|x| x.text}
        elsif type =~ /related synonym/i
          @synonyms['related'] = entry.xpath("list/string").collect {|x| x.text}
        elsif type =~ /subset/i
          @subset = entry.xpath("list/string").collect {|x| x.text}
        elsif type =~ /xref/i
          @xref = entry.xpath("list/string").text
        elsif type =~ /alt_id/i
          @alt_id = entry.xpath("list/string").text
        elsif type =~ /part_of/i
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @part_of.push(term)
          end
        elsif type =~ /\[R\]is_a/i
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @r_is_a.push(term)
          end
        elsif type =~ /is_a/i
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @is_a.push(term)
          end
        elsif type =~ /^\[R\]regulates/i
          @regulates["r_"] = []
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @regulates["r_"].push(term)
          end
        elsif type =~ /\[R\]positively_regulates/i
          @regulates["r_positively"] = []
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @regulates["r_positively"].push(term)
          end
        elsif type =~ /\[R\]negatively_regulates/i
          @regulates["r_negatively"] = []
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @regulates["r_negatively"].push(term)
          end
        elsif type =~ /^regulates/i
          @regulates["just"] = []
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @regulates["just"].push(term)
          end
        elsif type =~ /^positively_regulates/i
          @regulates["positively"] = []
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @regulates["positively"].push(term)
          end
        elsif type =~ /^negatively_regulates/i
          @regulates["negatively"] = []
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @regulates["negatively"].push(term)
          end
        elsif type =~ /\[R\]disjoint_from/i
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @r_disjoint_from.push(term)
          end
        elsif type =~ /disjoint_from/i
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @disjoint_from.push(term)
          end
        elsif type =~ /SuperClass/i
          entry.xpath("list/classBean").each do |bean|
            term = Term.new(:xml => bean, :ontology => @ontology)
            @super_class.push(term)
          end
        elsif type =~ /SubClass/i
          entry.xpath('list/classBean').each do |bean|
            t = Bioportal::Term.new(:xml => bean, :ontology => @ontology)
            # lets update the parents for this Term
            # t.parents = get_parents + [@id]
            @children.push(t)
          end
        else
          @relations[type] = entry
        end
      end
    end
    
    def to_s
      # if !@filled
        # fill
      # end
      return @id
    end
    
    def light
      if !@filled_light
        self.fill_light
      end
      return self
    end
    
    def complete
      if !@filled
        self.fill
      end
      return self
    end
    
    def fill
      if !@filled
        fill_from_xml(@ontology.get_term_xml(@id))
      end
    end
    
    def fill_light
      if !@filled_light
          doc = ontology.bio_portal.get_page("concepts/#{@ontology.id}/#{@id}", {:light => 1})
          if doc
            fill_from_xml(doc.xpath("success/data/classBean"))
          end
      end
    end
    
    def xml_url
      ontology.bio_portal.get_page_url("concepts/#{ontology.id}/#{id}")
    end
    
    def get_children
      if @children.nil?
        doc = ontology.bio_portal.get_page("concepts/#{ontology.id}/#{id}", {:light => 1})
        set_children_from_xml(doc)
      end
      return @children
    end
    
    def set_children_from_xml(xml)
      @children = []
      sub_classes = xml.xpath("success/data/classBean/relations/entry").reject {|e| e.xpath('string').text !~ /SubClass/}.first
      if sub_classes
        sub_classes.xpath('list/classBean').each do |term|
          t = Bioportal::Term.new(:xml => term, :ontology => ontology)
          # lets update the parents for this Term
          t.parents = get_parents + [@id]
          @children.push(t)
        end
      end   
    end
    
    def get_parents
      if @parents.nil?
        @parents = []
        # now we need to itterate up the superclass tree until we get to a class without a SuperClass
        parent_class = get_super_class
        while !parent_class.nil? and parent_class.size > 0
          parent_class.each do |parent|
            @parents.push(parent)
            parent_class = parent.complete.get_super_class
          end
        end
      end
      return @parents
    end
    
    def get_super_class
      if @super_class.nil? or (@super_class.size == 0 and @id != "owl:Thing")
        # Then we need to fill the object even if it thinks it is already filled
        # *** this will need more work
        @filled = false
        fill
      end
      return @super_class
    end

    # for now this will return a list of properties based on the parents of this Term and the matching properties with a domain of any
    # of this terms parents
    def get_properties
      if @properties.nil?
        parents = get_parents
        @properties = []
        term_properties = @ontology.get_properties_for_domain(@id)
        if term_properties
          @properties += term_properties
        end
        parents.each do |parent|
          parent_properties = @ontology.get_properties_for_domain(parent.id)
          if parent_properties
            @properties += parent_properties
          end
        end
        @properties.uniq!
      end
      return @properties
    end
  end
end