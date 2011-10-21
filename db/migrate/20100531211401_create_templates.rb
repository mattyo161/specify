class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.string :name
      t.string :version
      t.text :description
      t.string :uid
      t.string :codeValue
      t.string :codeMeaning
      t.string :codingSchemeDesignator
      t.string :codingSchemeVersion
      t.string :authors
      t.datetime :creationDate

      t.timestamps
    end
  end

  def self.down
    drop_table :templates
  end
end
