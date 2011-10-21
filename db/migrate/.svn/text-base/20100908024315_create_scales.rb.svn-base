class CreateScales < ActiveRecord::Migration
  def self.up
    create_table :scales do |t|
      t.string :comment
      t.string :description
      t.string :value
      t.integer :characteristic_quantification_id

      t.timestamps
    end
  end

  def self.down
    drop_table :scales
  end
end
