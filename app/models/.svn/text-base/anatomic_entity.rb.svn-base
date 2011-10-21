class AnatomicEntity < ActiveRecord::Base
  has_many :anatomic_entity_characteristics, :dependent => :destroy
  belongs_to :aim_template
  belongs_to :component
end
