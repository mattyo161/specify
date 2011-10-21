class AddCryptedPasswordToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :crypted_password, :string
  end

  def self.down
    remove_column :users, :crypted_password
  end
end
