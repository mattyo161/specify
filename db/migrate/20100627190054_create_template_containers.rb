class CreateTemplateContainers < ActiveRecord::Migration
  def self.up
    create_table :template_containers do |t|
      t.string :name
      t.string :version
      t.text :description
      t.string :authors
      t.datetime :creationDate

      t.timestamps
    end
  end

  def self.down
    drop_table :template_containers
  end
end
