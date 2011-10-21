class AnatomicEntityCharacteristic < ActiveRecord::Base
  belongs_to :anatomic_entity
  has_many :allowed_terms, :dependent => :destroy
end
