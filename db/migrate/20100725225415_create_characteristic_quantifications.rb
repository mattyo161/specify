class CreateCharacteristicQuantifications < ActiveRecord::Migration
  def self.up
    create_table :characteristic_quantifications do |t|
      t.string :name
      t.string :type
      t.integer :allowed_term_id

      t.timestamps
    end
  end

  def self.down
    drop_table :characteristic_quantifications
  end
end
