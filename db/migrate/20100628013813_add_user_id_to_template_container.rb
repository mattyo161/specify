class AddUserIdToTemplateContainer < ActiveRecord::Migration
  def self.up
    add_column :template_containers, :user_id, :integer
  end

  def self.down
    remove_column :template_containers, :user_id
  end
end
