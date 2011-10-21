class RenameAimTemplateIdInImagingObservations < ActiveRecord::Migration
  def self.up
    rename_column :imaging_observations, :aim_template_id, :component_id
  end

  def self.down
    rename_column :imaging_observations, :component_id, :aim_template_id
  end
end
