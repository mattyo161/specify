class AddLastLoginIpToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :last_login_ip, :string
  end

  def self.down
    remove_column :users, :last_login_ip
  end
end
