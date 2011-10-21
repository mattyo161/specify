class RenameAimTemplateId < ActiveRecord::Migration
  def self.up
    rename_column :anatomic_entities, :aim_template_id, :component_id
  end

  def self.down
    rename_column :anatomic_entities, :component_id, :aim_template_id
  end
end
