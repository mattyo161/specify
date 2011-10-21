class NonQuantifiable < ActiveRecord::Base
  belongs_to :characteristic_quantification
  belongs_to :allowed_term
end
