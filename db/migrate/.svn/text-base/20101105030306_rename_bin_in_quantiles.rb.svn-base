class RenameBinInQuantiles < ActiveRecord::Migration
  def self.up
    rename_column :quantiles, :bin, :bins
  end

  def self.down
    rename_column :quantiles, :bins, :bin
  end
end
