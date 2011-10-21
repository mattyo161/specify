class AddAnatomicEntityIdToAnatomicEntityCharacteristic < ActiveRecord::Migration
  def self.up
    add_column :anatomic_entity_characteristics, :anatomic_entity_id, :integer
  end

  def self.down
    remove_column :anatomic_entity_characteristics, :anatomic_entity_id
  end
end
