class CreateNumericals < ActiveRecord::Migration
  def self.up
    create_table :numericals do |t|
      t.string :ucumString
      t.float :value
      t.string :operator
      t.integer :characteristic_quantification_id

      t.timestamps
    end
  end

  def self.down
    drop_table :numericals
  end
end
