require 'java'
require 'XsdSchemaValidator.jar'
# require 'jing.jar'
include_class 'XsdSchemaValidator'
# include_class 'com.thaiopensource.validate.rng.CompactSchemaReader'
# include_class 'com.thaiopensource.validate.ValidationDriver'
# include_class 'org.xml.sax.InputSource'
# include_class 'java.io.StringReader'
# include_class 'java.io.StringWriter'
# include_class 'com.thaiopensource.xml.sax.ErrorHandlerImpl'
# include_class 'com.thaiopensource.util.PropertyMapBuilder'
# include_class 'com.thaiopensource.validate.ValidateProperty'

module XMLValidator
  attr_reader :error

#  def xml_validator(text)
#    @error = false
#    @schemaError = StringWriter.new
#    schemaEH = ErrorHandlerImpl.new(@schemaError)
#    properties = PropertyMapBuilder.new
#    properties.put(ValidateProperty::ERROR_HANDLER, schemaEH)

#    @driver = ValidationDriver.new(properties.toPropertyMap, CompactSchemaReader.getInstance)
#    if !@driver.loadSchema(InputSource.new(StringReader.new(text)))
#      @error = @schemaError.toString;
#    end
#  end

  def xml_validate(text)
    schemaName = Rails.public_path + '/AIMTemplate.xsd'
    # xmlName = 'public/AIM_Template_v1rv15_TCGA_Example.xml'
    # XsdSchemaValidator.validateXml(schemaName, xmlName)
    str = XsdSchemaValidator.validateXml(schemaName, text)
#    if @driver.validate(InputSource.new(StringReader.new(text)))
#      return true
#    else
#      @error = @schemaError.toString
#      return false
#    end
  end
end
