class CharacteristicQuantification < ActiveRecord::Base
  belongs_to :allowed_term
  has_many :numericals, :dependent => :destroy
  has_many :non_quantifiables, :dependent => :destroy
  has_many :intervals, :dependent => :destroy
  has_one :quantile, :dependent => :destroy
  has_one :scale, :dependent => :destroy

  @@types = %w(numericals intervals quantile scale) # non_quantifiables

  def self.types # self => class method
    @@types
  end

  def set_type(type1 = nil) # instance method
    type1 = @@types.find_all { |type| [self.send(type)].flatten.any? }[0] if type1 == nil # there should be only one non-nil result
    self.update_attributes(:quantification_type => type1) if @@types.include?(type1) && !self.send(type1).blank?
  end

  def change_type(quant_type = nil)
    type1 = self.quantification_type
    self.update_attributes(:quantification_type => quant_type) if type1.blank? || self.send(type1).blank?
  end
end
