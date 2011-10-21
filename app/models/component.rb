class Component < ActiveRecord::Base
  belongs_to :aim_template
  has_one :imaging_observation, :dependent => :destroy
  has_one :anatomic_entity, :dependent => :destroy
  has_one :inference, :dependent => :destroy
  has_one :calculation, :dependent => :destroy
  has_many :allowed_terms, :dependent => :destroy
  # has_many :characteristic_quantifications, :dependent => :destroy

  @@types = %w(imaging_observation anatomic_entity inference calculation)

  def self.types # self => class method
    @@types
  end

  def set_type # instance method
    type1 = @@types.find_all { |type| self.send(type) }[0]
    self.update_attributes(:component_type => type1)
  end
end
