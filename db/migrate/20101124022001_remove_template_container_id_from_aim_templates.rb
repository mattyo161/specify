class RemoveTemplateContainerIdFromAimTemplates < ActiveRecord::Migration
  def self.up
    remove_column :aim_templates, :template_container_id
  end

  def self.down
    add_column :aim_templates, :template_container_id, :integer
  end
end
