class CreateBpTerms < ActiveRecord::Migration
  def self.up
    create_table :bp_terms do |t|
      t.string :name
      t.string :bpid
      t.integer :bp_ontology_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_terms
  end
end
