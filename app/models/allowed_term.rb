class AllowedTerm < ActiveRecord::Base
  belongs_to :component
  belongs_to :imaging_observation_characteristic
  belongs_to :anatomic_entity_characteristic
  has_many :non_quantifiables
  has_one :characteristic_quantification, :dependent => :destroy
end
