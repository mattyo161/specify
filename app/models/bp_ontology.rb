class BpOntology < ActiveRecord::Base
  has_many :terms
  has_many :properties
end
