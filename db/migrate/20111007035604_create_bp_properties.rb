class CreateBpProperties < ActiveRecord::Migration
  def self.up
    create_table :bp_properties do |t|
      t.integer :bp_ontology_id
      t.string :name
      t.string :bpid
      t.integer :domain
      t.integer :range

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_properties
  end
end
