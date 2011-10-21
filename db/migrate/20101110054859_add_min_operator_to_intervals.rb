class AddMinOperatorToIntervals < ActiveRecord::Migration
  def self.up
    add_column :intervals, :minOperator, :string
  end

  def self.down
    remove_column :intervals, :minOperator
  end
end
