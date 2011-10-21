class AimTemplate < ActiveRecord::Base
  has_one :template_store # , :dependent => :destroy
  has_many :components, :dependent => :destroy
  belongs_to :user
  has_and_belongs_to_many :template_containers
end
