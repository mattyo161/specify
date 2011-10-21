class CreateNonQuantifiables < ActiveRecord::Migration
  def self.up
    create_table :non_quantifiables do |t|
      t.string :codeMeaning
      t.string :codeValue
      t.string :codingSchemeDesignator
      t.string :codingSchemeVersion
      t.integer :characteristic_quantification_id

      t.timestamps
    end
  end

  def self.down
    drop_table :non_quantifiables
  end
end
