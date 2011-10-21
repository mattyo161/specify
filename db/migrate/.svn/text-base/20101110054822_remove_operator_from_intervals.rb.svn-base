class RemoveOperatorFromIntervals < ActiveRecord::Migration
  def self.up
    remove_column :intervals, :operator
  end

  def self.down
    add_column :intervals, :operator, :string
  end
end
