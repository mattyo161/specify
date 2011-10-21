# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
# app/controllers/application.rb
#require 'rubygems'
require 'XMLValidator'
# Add require for speicfy app
require 'bioportal'
require 'nokogiri'

class ApplicationController < ActionController::Base  
  include XMLValidator
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  @@tfields = ['name', 'version', 'authors', 'description', 'uid', 'codeValue', 'codeMeaning', 'codingSchemeDesignator'] # 'creationDate'
  @@compfields = ['label', 'minCardinality', 'maxCardinality', 'itemNumber', 'shouldDisplay', 'explanatoryText', 'authors']
  @@iofields = ['annotatorConfidence']
  @@iocfields = ['label', 'minCardinality', 'maxCardinality', 'itemNumber', 'shouldDisplay', 'explanatoryText', 'authors', 'annotatorConfidence']
  @@aefields = ['annotatorConfidence']          
  @@inffields = ['annotatorConfidence']
  @@calcfields = ['uid', 'description', 'mathML', 'algorithmName', 'algorithmVersion']
  @@atfields = ['codeMeaning', 'codeValue', 'codingSchemeDesignator']
  @@cqfields = ['name', 'annotatorConfidence']
  @@aecfields = ['label', 'minCardinality', 'maxCardinality', 'itemNumber', 'shouldDisplay', 'explanatoryText', 'authors', 'annotatorConfidence']   
  @@numfields = ['ucumString', 'value', 'operator']
  @@nqfields = ['codeMeaning', 'codeValue', 'codingSchemeDesignator', 'codingSchemeVersion']
  @@intfields = ['ucumString', 'maxValue', 'minValue', 'minOperator', 'maxOperator']
  @@quantfields = ['bins']
  @@scalefields = ['comment', 'description', 'value']
  @@ordfields = ['integerValue', 'description']
  @@quants = {:Numerical => @@numfields,  :NonQuantifiable => @@nqfields, :Interval => @@intfields, :Quantile => @@quantfields, :Scale => @@scalefields}
  @@lexfields = ['codeMeaning', 'codeValue', 'codingSchemeDesignator', 'description', 'codingSchemeVersion', 'lexiconName']
  # private
  def to_hash(obj, fields, optional_data = {})
    Hash[*fields.map { |f| [f, obj[f]] if f != nil && obj[f] != nil }.flatten.compact].merge(optional_data) if obj != nil
    # fields.map { |f| [f, obj[f]] if f && obj[f] }.flatten.compact
  end
  def show_obj(obj)
		str = "<br><a href=\"/" + obj.to_s.tableize + "/new\" class=\"get\">Create a new " + obj.to_s.titleize + "</a><div class=\"new" + obj.to_s + "\"></div>
           <div class=\"" + obj.to_s.tableize + "\">" + render_to_string(:file => '/' + obj.to_s.tableize + '/' + obj.to_s.tableize + '.erb') + '</div>'
		# str = 'current_user = ' + current_user.login
  end
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
  def store_location
    session[:return_to] = request.request_uri
  end
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  def container_xml(tcont) # builds XML for a template container element
    # (Document.new File.new('public/AIMTemplate_v1rv15.xsd'))[6].children.map { |x| x if x.to_s != "\n\t" && x.to_s != "\n" }.find_all { |f| !f.nil? }
    # (Document.new File.new('public/AIMTemplate_v1rv15.xsd')).elements[1].elements.map
    # root = XML::Document.new().root 
    # root << tc = XML::Node.new('TemplateContainer')
    # attrv = attrs.each { |a| root[a] = tcont[a] }
    # attrs0.keys.each { |key| root[key] = attrs[key] }
    # sout = '<?xml version="1.0" encoding="UTF-8"?>' # initialize
    attrs = ['authors', 'name', 'version', 'description']
    data0 = {'creationDate' => tcont.creationDate.strftime('%Y-%m-%d'), 'xsi:schemaLocation' => 'gme://caCORE.caCORE/3.2/edu.northwestern.radiology.AIMTemplate AIMTemplate_v1rv18.xsd',  'xmlns' => "gme://caCORE.caCORE/3.2/edu.northwestern.radiology.AIMTemplate", 'xmlns:xsi' =>  "http://www.w3.org/2001/XMLSchema-instance"} # 'xsi:schemaLocation' => "gme://caCORE.caCORE/3.2/edu.northwestern.radiology.AIMTemplate AIMTemplate_v1rv15.xsd",
    # sout += aim_xml(tcont, attrs, data0, false)
    # aim_xml(tcont, attrs, data0)
    xml = Builder::XmlMarkup.new(:target => "", :indent => 2)
    xml.instruct!
    xml.TemplateContainer(to_hash(tcont, attrs).merge(data0)) do
      tcont.aim_templates.each do |tk|
        #  root << tk = XML::Node.new(tk.to_s)
        # sout += template_xml(tk, xml)
        template_xml(tk, xml)
      end
    end
    # sout += "</TemplateContainer>"
    # sout += '\n' + xml
  end
  def template_xml(temp, xml)
    # <Template name="VASARI_TWO" version="1.0" authors="AIM Team" creationDate="2010-02-15" description="This is a VASARI template version 2." uid="123.987.32156.8454.1213156464.87987" codeValue="VASARI-1" codeMeaning="Brain Tumor Measurement" codingSchemeDesignator="VASARI">
    # ...
    # </Template>
    # sout = '' # initialize
    # xml = Builder::XmlMarkup.new(sout)
    # xml.Template do 
    templateHash = to_hash(temp, @@tfields).merge({'creationDate' => temp.creationDate.strftime('%Y-%m-%d')})
    xml.Template(templateHash) do
      temp.components.each do |comp|
        component_xml(comp, xml)
      end
    end
  end
  def component_xml(comp, xml)
    xml.Component(to_hash(comp, @@compfields)) do
      io = comp.imaging_observation
      xml.ImagingObservation(to_hash(io, @@iofields)) do
        io.imaging_observation_characteristics.each do |ioc|
          xml.ImagingObservationCharacteristic(to_hash(ioc, @@iocfields)) do
            ioc.allowed_terms.each do |at|
              at_xml(at, xml)
            end
          end
        end
      end if io
      ae = comp.anatomic_entity
      xml.AnatomicEntity(to_hash(ae, @@aefields)) do
        ae.anatomic_entity_characteristics.each do |aec|
          xml.AnatomicEntityCharacteristic(to_hash(aec, @@aecfields)) do
            aec.allowed_terms.each do |at|
              at_xml(at, xml)
            end
          end
        end
      end if ae
      xml.Inference(to_hash(comp.inference, @@inffields)) if comp.inference
      xml.Calculation(to_hash(comp.calculation, @@calcfields)) if comp.calculation
      comp.allowed_terms.each do |at|
        at_xml(at, xml)
      end
    end
  end
  def at_xml(at, xml)
    # @@atfields = ['codeMeaning', 'codeValue', 'codingSchemeDesignator', 'imaging_observation_characteristic_id']
    xml.AllowedTerm(to_hash(at, @@atfields)) do
      at.characteristic_quantification.to_a.each do |cq|
        cq_xml(cq, xml)
      end
    end
  end
  def cq_xml(cq, xml)
    # @@cqfields = ['name', 'quantification_type', 'allowed_term_id']
    xml.CharacteristicQuantification(to_hash(cq, @@cqfields)) do
      cq.send(cq.quantification_type).to_a.each do |quant|
        case cq.quantification_type
        when "numericals" then num_xml(quant, xml)
          # when "_qunonantifiables" then nq_xml(quant, xml)
        when "intervals" then int_xml(quant, xml)
        when "quantile" then quant_xml(quant, xml)
        when "scale" then scale_xml(quant, xml)
        end
      end unless cq.quantification_type.blank?
      cq.non_quantifiables.each do |nq|
        nq_xml(nq, xml)
      end
    end
  end
  def num_xml(num, xml)
    xml.Numerical(to_hash(num, @@numfields))
  end
  def nq_xml(nq, xml)
    xml.NonQuantifiable(to_hash(nq, @@nqfields))
  end
  def int_xml(int, xml)
    xml.Interval(to_hash(int, @@intfields))
  end
  def quant_xml(quant, xml)
    xml.Quantile(to_hash(quant, @@quantfields))
  end
  def scale_xml(scale, xml)
    xml.Scale(to_hash(scale, @@scalefields)) do
      scale.ordinal_levels.each do |ord|
        ord_xml(ord, xml)
      end
    end unless scale.blank?
  end
  def ord_xml(ord, xml)
    xml.OrdinalLevel(to_hash(ord, @@ordfields))
  end
  # def ae_xml(ae)
  #  fields = ['annotatorConfidence']
  #  sout = aim_xml(ae, fields)
  #  # ae.allowed_terms
  # end
  def aim_xml(obj, fields, extra_data = {}, name = obj.class.to_s)
    # 	fields
    # to_hash(obj, fields)
    # to_hash(obj, fields).merge(extra_data)
    # Builder::XmlMarkup.new.tag! name, to_hash(obj, fields).merge(extra_data)
    y = to_hash(obj, fields)
    b = Builder::XmlMarkup.new.tag!(obj.class.to_s, y.merge(extra_data))
  end
  def buildAllowedTerm(aterm, id)
    #		aterm.children.find_all { |f| f.name == 'CharacteristicQuantification' }.each do |charquant|
    #		  characteristic_quantification = CharacteristicQuantification.new(to_hash(charquant, @@cqfields, { :allowed_term_id => id }))
    #      characteristic_quantification.save!
    #      buildCharacteristicQuantification(charquant, characteristic_quantification.id)
    #		end
    aterm.children.find_all { |f| f.name == 'CharacteristicQuantification' }.each do |cq|
      characteristic_quantification = CharacteristicQuantification.new(to_hash(cq, @@cqfields, { :allowed_term_id => id }))
      characteristic_quantification.save!
      buildCharacteristicQuantification(cq, characteristic_quantification.id)
      characteristic_quantification.set_type
    end
    aterm.children.find_all { |f| f.name == 'NonQuantifiable' }.each do |nq|
      non_quantifiable = NonQuantifiable.new(to_hash(nq, @@quants[:NonQuantifiable], { :allowed_term_id => id }))
      non_quantifiable.save!
    end
  end
  def buildCharacteristicQuantification(cq, id)
    CharacteristicQuantification.types.each do |type1|
      cq.children.find_all { |f| f.name == type1.singularize.camelcase }.each do |quant|
        quant_object = Object.const_get(quant.name).new(to_hash(quant, @@quants[quant.name.to_sym], { :characteristic_quantification_id => id }))
        quant_object.save!
        buildScale(quant, quant_object.id) if quant.name == 'Scale'
      end
    end
    cq.children.find_all { |f| f.name == 'NonQuantifiable' }.each do |nonquant|
      non_quantifiable = NonQuantifiable.new(to_hash(nonquant, @@quants[:NonQuantifiable], { :characteristic_quantification_id => id } ))
      non_quantifiable.save!
    end
  end
  def buildScale(quant, id)
    quant.children.find_all { |f| f.name == 'OrdinalLevel' }.each do |ord|
      ordinal_level = OrdinalLevel.new(to_hash(ord, @@ordfields, { :scale_id => id }))
      ordinal_level.save!
    end
  end
  def buildTemplateContainer(xml_data)
    if xml_data == nil || xml_data == ""
      return
    end
    root = XML::Parser.string( xml_data ).parse.root # template container = root
    # root.register_namespace("aim_template:gme://caCORE.caCORE/3.2/edu.northwestern.radiology.AIMTemplate")
    # root.register_default_namespace('aim_template')
    tc = TemplateContainer.new(to_hash(root, ['name', 'version', 'description', 'authors'], {:user_id => current_user.id, :creationDate => Date.today.strftime('%Y-%m-%d')}))
    tc.save!
    ts = TemplateStore.new({ :templatetext => xml_data, :template_container_id => tc.id.to_s, :user_id => current_user.id })
    ts.save!
    root.children.find_all { |f| f.name == 'Template' }.each do |aimtemp| # aimtemp := aim template
      buildTemplate(aimtemp, tc) # aimtemp is the XML "template" data, tc is the TemplateContainer object
    end
  end
  def buildTemplate(aimtemp, tc = nil) # aimtemp is the XML "template" data, tc is the TemplateContainer object
    aim_template = AimTemplate.new(to_hash(aimtemp, ['name', 'version', 'description', 'uid', 'codeValue', 'codeMeaning', 'codingSchemeDesignator', 'codingSchemeVersion', 'authors'], { :user_id => current_user.id, :creationDate => Date.today.strftime('%Y-%m-%d') }))
    aim_template.save!
    aim_template.template_containers |= [tc] unless tc.blank?
    tc.aim_templates |= [aim_template] unless tc.blank?
    aimtemp.children.find_all { |f| f.name == 'Component' }.each do |comp|
      buildComponent(comp, aim_template.id)
    end # aimtemp.children.find_all { |f| f.name == 'Component' }.each do |comp|
    aim_template
  end
  def buildComponent(comp, id)
    component = Component.new(to_hash(comp, @@compfields, {:aim_template_id => id }))
    component.save!
    comp.children.find_all { |f| f.name == 'ImagingObservation' }.each do |io|
      imaging_observation = ImagingObservation.new(to_hash(io, ['annotatorConfidence'], { :component_id => component.id }))
      imaging_observation.save!
      io.children.find_all { |f| f.name == 'ImagingObservationCharacteristic' }.each do |ioc|
        imaging_observation_characteristic = ImagingObservationCharacteristic.new(to_hash(ioc, @@iocfields, {:imaging_observation_id => imaging_observation.id}))
        imaging_observation_characteristic.save!
        ioc.children.find_all { |f| f.name == 'AllowedTerm' }.each do |aterm|
          allowed_term = AllowedTerm.new(to_hash(aterm, @@atfields, {:imaging_observation_characteristic_id => imaging_observation_characteristic.id }))
          allowed_term.save!
          buildAllowedTerm(aterm, allowed_term.id)
        end # ioc.children.find_all { |f| f.name == 'AllowedTerm' }.each do |aterm|
      end # io.children.find_all { |f| f.name == 'ImagingObservationCharacteristic' }.each do |ioc|
    end # comp.children.find_all { |f| f.name == 'ImagingObservation' }.each do |io|
    comp.children.find_all { |f| f.name == 'AnatomicEntity' }.each do |ae|
      anatomic_entity = AnatomicEntity.new(to_hash(ae, @@aefields, { :component_id => component.id }))
      anatomic_entity.save!
      ae.children.find_all { |f| f.name == 'AnatomicEntityCharacteristic' }.each do |aec|
        anatomic_entity_characteristic = AnatomicEntityCharacteristic.new(to_hash(aec, @@aecfields, {:anatomic_entity_id => anatomic_entity.id }))
        anatomic_entity_characteristic.save!
        aec.children.find_all { |f| f.name == 'AllowedTerm' }.each do |aterm|
          allowed_term = AllowedTerm.new(to_hash(aterm, @@atfields, { :anatomic_entity_characteristic_id => anatomic_entity_characteristic.id }))
          allowed_term.save!
          buildAllowedTerm(aterm, allowed_term.id)
        end
      end
    end # comp.children.find_all { |f| f.name == 'AnatomicEntity' }.each do |ae|
    comp.children.find_all { |f| f.name == 'Inference' }.each do |inf|
      inference = Inference.new(to_hash(inf, @@inffields, { :component_id => component.id }))
      inference.save!
    end
    comp.children.find_all { |f| f.name == 'Calculation' }.each do |calc|
      calculation = Calculation.new(to_hash(calc, @@calcfields, { :component_id => component.id }))
      calculation.save!
    end
    comp.children.find_all { |f| f.name == 'AllowedTerm' }.each do |aterm|
      allowed_term = AllowedTerm.new(to_hash(aterm, @@atfields, { :component_id => component.id }))
      allowed_term.save!
      buildAllowedTerm(aterm, allowed_term.id)
    end
    component.set_type
    component
  end
  def copy_template(at) # at is the AimTemplate object to copy
    at_xml = Builder::XmlMarkup.new(:target => "", :indent => 2)
    templateXML = template_xml(at, at_xml)
    templateXML = XML::Parser.string( templateXML ).parse.root
    aim_template = buildTemplate(templateXML)
    #aim_template.update_attributes({:user_id => current_user.id.to_s, :creationDate => Date.today.strftime('%Y-%m-%d'), :authors => current_user.login})
    #aim_template.save!
    # aim_template.template_containers = at.template_containers
  end
  def copy_lexicon_term(lt) # lt is the LexiconTerm object to copy
    lt_xml = Builder::XmlMarkup.new(:target => "", :indent => 2)
    lexiconTermXML = lexicon_term_xml(lt, lt_xml)
    lexiconTermXML = XML::Parser.string( lexiconTermXML ).parse.root
    lexicon_term = buildLexiconTerm(lexiconTermXML)
  end
  def copy_component(comp)
    comp_xml = Builder::XmlMarkup.new(:target => "", :indent => 2)
    componentXML = component_xml(comp, comp_xml)
    componentXML = XML::Parser.string( componentXML ).parse.root
    component = buildComponent(componentXML, comp.aim_template_id)
    # component.update_attributes({:authors => current_user.login})
  end
  def lexicon_term_xml(lt, lt_xml)
    lt_xml.LexiconTerm(to_hash(lt, @@lexfields)) do
      lt.lexicon_terms.each do |term|
        lexicon_term_xml(term, lt_xml)
      end
    end
  end
  def buildLexiconTerm(lex_node, id = nil)
    lexicon_term = LexiconTerm.new(to_hash(lex_node, @@lexfields, { :lexicon_term_id => id }))
    lexicon_term.save!
    lex_node.children.find_all { |f| f.name == 'LexiconTerm' }.each do |lt|
      lexicon_term = LexiconTerm.new(to_hash(lt, @@lexfields, { :lexicon_term_id => id }))
      lexicon_term.save!
      buildLexiconTerm(lt, lexicon_term.id)
    end
  end
  def root_terms(name)
    LexiconTerm.scoped(:conditions=>["lexiconName=?", name]).find_all { |f| f.lexicon_term_id.blank? }
  end
  def update_attribute
    obj = Object.const_get(params[:object].singularize.camelcase).find(params[:id])
    obj.update_attributes(params[:attribute] => params[:value])
    @aim_template = AimTemplate.find(params[:aim_template_id]) unless params[:aim_template_id].blank?
    @lexicon_terms = root_terms(obj.lexiconName) if obj.class.to_s == 'LexiconTerm'
    # @obj = obj
    respond_to do |format|
      format.js { render :file => params[:file].blank? ? '/main/update_attribute.js.erb' : params[:file] }
    end
  end
  #def update_attribute
  #  Object.const_get(params[:object].singularize.camelcase).find(params[:id]).update_attributes(params[:attribute] => params[:value])
  #  @aim_template = AimTemplate.find(params[:aim_template_id])
  #  respond_to do |format|
  #    format.js { render :file => '/main/update_attribute.js.erb' }
  #  end
  #end
  def delete_row
    Object.const_get(params[:object].singularize.camelcase).find(params[:id]).destroy
    @aim_template = AimTemplate.find(params[:aim_template_id])
    respond_to do |format|
      format.js { render :file => '/main/update_attribute.js.erb' }
    end
  end
  def add_row # 
    obj = Object.const_get(params[:object].singularize.camelcase)
    params[:parent_id] = (Object.const_get(params[:parent_object].singularize.camelcase).last.blank? ? nil : Object.const_get(params[:parent_object].singularize.camelcase).last.id) if params[:parent_id] == 'last'
    # you can specify the parent id using the child id if you want, otherwise it uses parent_id:
    parent = params[:parent_id].blank? ? (params[:id] == '0' ? nil : obj.find(params[:id]).send(params[:parent_object].singularize)) : Object.const_get(params[:parent_object].singularize.camelcase).find(params[:parent_id]) if params[:parent_object]
    # parent = Object.const_get(params[:parent_object].singularize.camelcase).new(params[:grandparent].singularize + '_id' => params[:grandparent_id]) unless params[:grandparent].blank? && params[:grandparent_id].blank?
    # parent.update_attributes(params[:parent_data]) unless params[:grandparent].blank? && params[:grandparent_id].blank?
    # parent.save! unless params[:grandparent].blank? && params[:grandparent_id].blank?
    newobj = (params[:parent_object].blank? || parent.blank?) ? obj.new : obj.new(params[:parent_object].singularize + '_id' => parent.id)
    newobj.save!
    newobj.update_attributes(params[:data]) unless params[:data].blank?
    newobj.update_attributes(:authors => current_user.login) unless (defined? newobj.authors).blank?
    @aim_template = AimTemplate.find(params[:aim_template_id]) unless params[:aim_template_id].blank?
    @lexicon_terms = root_terms(newobj.lexiconName) if obj.to_s == 'LexiconTerm'
    respond_to do |format|
      format.js { params[:no_refresh].blank? ? (render :file => params[:file].blank? ? '/main/update_attribute.js.erb' : params[:file]) : (render :nothing => true) }
    end
  end
  
  # Begin additional code for Specify App
  # Matt Ouellette - matt@SperlingInteractive.com
  # ** will need to move this into a separate file at some point
  before_filter :set_bioportal
  
  def set_bioportal
   if @bioportal.nil?
      use_bioportal_production
      # live configuration
      # test configuration
      # @bioportal = Bioportal(:apikey => "6d3a093c-f01e-4003-b616-adcc5889a7fb", :base_url => "http://stagerest.bioontology.org/bioportal")
      @bioportal.show_urls = true
    end
  end
  
  def use_bioportal_stage
    if @bioportal.nil?
      @bioportal = Bioportal(:apikey => "6d3a093c-f01e-4003-b616-adcc5889a7fb", :base_url => "http://stagerest.bioontology.org/bioportal")
    else
      @bioportal.apikey = "6d3a093c-f01e-4003-b616-adcc5889a7fb"
      @bioportal.base_url = "http://stagerest.bioontology.org/bioportal"
    end
    puts "use bioportal stage - #{@bioportal.base_url}"
  end
  
  def use_bioportal_production
    if @bioportal.nil?
      @bioportal = Bioportal(:apikey => "6d3a093c-f01e-4003-b616-adcc5889a7fb", :base_url => "http://rest.bioontology.org/bioportal")
    else
      @bioportal.apikey = "6d3a093c-f01e-4003-b616-adcc5889a7fb"
      @bioportal.base_url = "http://rest.bioontology.org/bioportal"
    end
    puts "use bioportal production - #{@bioportal.base_url}"
  end
  # End additional code for Specify App



  
end
#def buildCharacteristicQuantification(charquant, id)
#  charquant.children.find_all { |f| f.name == 'Numerical' }.each do |num|
#    numerical = Numerical.new(to_hash(num, @@numfields, { :characteristic_quantification_id => id }))
#    numerical.save!
#  end
#  charquant.children.find_all { |f| f.name == 'NonQuantifiable' }.each do |nonquant|
#    non_quantifiable = NonQuantifiable.new(to_hash(nonquant, @@nqfields, { :characteristic_quantification_id => id }))
#    non_quantifiable.save!
#  end
#  charquant.children.find_all { |f| f.name == 'Interval' }.each do |int|
#    interval = Interval.new(to_hash(int, @@intfields, { :characteristic_quantification_id => id }))
#    interval.save!
#  end
#end
#
#      >>> from cq_xml():
#      cq.numericals.each do |num|
#        xml.Numerical(to_hash(num, @@numfields))
#      end
#      cq.non_quantifiables.each do |nq|
#        xml.NonQuantifiable(to_hash(nq, @@nqfields))
#      end
#      cq.intervals.each do |int|
#        xml.Interval(to_hash(int, @@intfields))
#      end
#    end
