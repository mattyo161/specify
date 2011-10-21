class RenameTemplateIds < ActiveRecord::Migration
  def self.up
    rename_column :imaging_observations, :template_id, :aim_template_id
    rename_column :anatomic_entities, :template_id, :aim_template_id
  end

  def self.down
    rename_column :imaging_observations, :aim_template_id, :template_id
    rename_column :anatomic_entities, :aim_template_id, :template_id
  end
end
