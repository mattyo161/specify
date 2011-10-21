class ImagingObservation < ActiveRecord::Base
  has_many :imaging_observation_characteristics
  belongs_to :aim_template
  belongs_to :component
end
