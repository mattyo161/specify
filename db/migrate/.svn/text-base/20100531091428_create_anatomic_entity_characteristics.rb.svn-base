class CreateAnatomicEntityCharacteristics < ActiveRecord::Migration
  def self.up
    create_table :anatomic_entity_characteristics do |t|
      t.string :label
      t.integer :minCardinality
      t.integer :maxCardinality
      t.integer :itemNumber
      t.boolean :shouldDisplay
      t.text :explanatoryText
      t.string :authors
      t.boolean :annotatorConfidence

      t.timestamps
    end
  end

  def self.down
    drop_table :anatomic_entity_characteristics
  end
end
