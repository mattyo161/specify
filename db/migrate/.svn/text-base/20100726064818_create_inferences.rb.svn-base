class CreateInferences < ActiveRecord::Migration
  def self.up
    create_table :inferences do |t|
      t.boolean :annotatorConfidence
      t.integer :component_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inferences
  end
end
