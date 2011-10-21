class CreateIntervals < ActiveRecord::Migration
  def self.up
    create_table :intervals do |t|
      t.string :ucumString
      t.float :maxValue
      t.float :minValue
      t.string :operator
      t.integer :characteristic_quantification_id

      t.timestamps
    end
  end

  def self.down
    drop_table :intervals
  end
end
