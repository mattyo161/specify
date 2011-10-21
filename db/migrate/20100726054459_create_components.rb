class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :label
      t.integer :minCardinality
      t.integer :maxCardinality
      t.integer :itemNumber
      t.boolean :shouldDisplay
      t.string :explanatoryText
      t.string :authors
      t.integer :aim_template_id

      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
