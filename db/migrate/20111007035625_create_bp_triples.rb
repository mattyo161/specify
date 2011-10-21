class CreateBpTriples < ActiveRecord::Migration
  def self.up
    create_table :bp_triples do |t|
      t.integer :domain
      t.string :property
      t.integer :range

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_triples
  end
end
