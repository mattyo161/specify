class RenameAimTemplateIdInTemplateStores < ActiveRecord::Migration
  def self.up
    rename_column :template_stores, :aim_template_id, :template_container_id
  end

  def self.down
    rename_column :template_stores, :template_container_id, :aim_template_id
  end
end
