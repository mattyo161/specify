class CreateQuantiles < ActiveRecord::Migration
  def self.up
    create_table :quantiles do |t|
      t.integer :bin
      t.integer :characteristic_quantification_id

      t.timestamps
    end
  end

  def self.down
    drop_table :quantiles
  end
end
