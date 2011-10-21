class CreateBpOntologies < ActiveRecord::Migration
  def self.up
    create_table :bp_ontologies do |t|
      t.string :name
      t.string :description
      t.string :abbreviation
      t.integer :versionid
      t.integer :ontologyid

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_ontologies
  end
end
