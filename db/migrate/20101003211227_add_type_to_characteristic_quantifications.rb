class AddTypeToCharacteristicQuantifications < ActiveRecord::Migration
  def self.up
    add_column :characteristic_quantifications, :quantification_type, :string
  end

  def self.down
    remove_column :characteristic_quantifications, :quantification_type
  end
end
