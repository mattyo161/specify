module Bioportal
  class Property
    attr_accessor :id, :full_id, :label, :obsolete, :ontology,
          :relations, :type, :range, :domain
          
    def initialize(params = nil)
      if params
        if params[:ontology]
          @ontology = params[:ontology]
        end
        if params[:xml]
          xml = params[:xml]
          @id = xml.xpath("id").text
          @full_id = xml.xpath("fullId").text
          @label = xml.xpath("label").text
          @type = xml.xpath("type").text
          @obsolete = xml.xpath("isObsolete").text != '0'
          @relations = {}
          xml.xpath("relations/entry").each do |entry|
            type = entry.xpath("string").first
            if type
              if type.text == "Range"
                if entry.xpath("string")[1]
                  @range = entry.xpath("string")[1].text
                elsif entry.xpath("classBean")[0]
                  propertyClass = entry.xpath("classBean")[0]
                  # right now we only need to search our current ontology, will worry more about this later
                  if propertyClass.xpath("id").first
                    @range = Term.new(:ontology => @ontology, :id => propertyClass.xpath("id").first.text)
                  else
                    puts "WARNING: could not interpret domain"
                    puts propertyClass.text
                  end
                else
                  puts "WARNING: could not interpret range"
                  puts type.text
                end
              elsif type.text == "Domain"
                if entry.xpath("string")[1]
                  @domain = entry.xpath("string")[1].text
                elsif entry.xpath("classBean")[0]
                  propertyClass = entry.xpath("classBean")[0]
                  # right now we only need to search our current ontology, will worry more about this later
                  if propertyClass.xpath("id").first
                    @domain = Term.new(:ontology => @ontology, :id => propertyClass.xpath("id").first.text)
                  else
                    puts "WARNING: could not interpret domain"
                    puts propertyClass.text
                  end
                else
                  puts "WARNING: could not interpret domain"
                  puts type.text
                end
              else
                puts "WARNING: Could not determine type of relation"
                puts entry.text
              end
            else
              puts "WARNING: Could not determine type of relation"
              puts entry.text
            end
          end
        end
      end
    end
    
    def xml_url
      ontology.bio_portal.get_page_url("ontologies/properties/#{ontology.id}")
    end
    
    
  end
end