class CreateTemplateStores < ActiveRecord::Migration
  def self.up
    create_table :template_stores do |t|
      t.integer :user_id
      t.text :templatetext

      t.timestamps
    end
  end

  def self.down
    drop_table :template_stores
  end
end
