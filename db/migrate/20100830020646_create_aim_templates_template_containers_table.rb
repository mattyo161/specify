class CreateAimTemplatesTemplateContainersTable < ActiveRecord::Migration
  def self.up
    create_table :aim_templates_template_containers, :id => false do |t|
      t.references :aim_template, :null => false
      t.references :template_container, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :aim_templates_template_containers
  end
end
