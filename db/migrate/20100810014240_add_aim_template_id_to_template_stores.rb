class AddAimTemplateIdToTemplateStores < ActiveRecord::Migration
  def self.up
    add_column :template_stores, :aim_template_id, :integer
  end

  def self.down
    remove_column :template_stores, :aim_template_id
  end
end
