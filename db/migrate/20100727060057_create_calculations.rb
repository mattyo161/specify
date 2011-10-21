class CreateCalculations < ActiveRecord::Migration
  def self.up
    create_table :calculations do |t|
      t.string :uid
      t.string :description
      t.string :mathML
      t.string :algorithmName
      t.string :algorithmVersion

      t.timestamps
    end
  end

  def self.down
    drop_table :calculations
  end
end
