class AddTemplateContainerIdToAimTemplate < ActiveRecord::Migration
  def self.up
    add_column :aim_templates, :template_container_id, :integer
  end

  def self.down
    remove_column :aim_templates, :template_container_id
  end
end
