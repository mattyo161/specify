class CreateOrdinalLevels < ActiveRecord::Migration
  def self.up
    create_table :ordinal_levels do |t|
      t.integer :integerValue
      t.string :description
      t.integer :scale_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ordinal_levels
  end
end
