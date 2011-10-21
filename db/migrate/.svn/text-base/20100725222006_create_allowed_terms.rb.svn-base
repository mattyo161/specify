class CreateAllowedTerms < ActiveRecord::Migration
  def self.up
    create_table :allowed_terms do |t|
      t.string :codeMeaning
      t.string :codeValue
      t.string :codingSchemeDesignator
      t.integer :imaging_observation_characteristic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :allowed_terms
  end
end
