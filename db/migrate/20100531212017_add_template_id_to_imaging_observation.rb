class AddTemplateIdToImagingObservation < ActiveRecord::Migration
  def self.up
    add_column :imaging_observations, :template_id, :integer
  end

  def self.down
    remove_column :imaging_observations, :template_id
  end
end
