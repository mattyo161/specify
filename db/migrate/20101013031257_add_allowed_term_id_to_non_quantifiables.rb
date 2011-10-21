class AddAllowedTermIdToNonQuantifiables < ActiveRecord::Migration
  def self.up
    add_column :non_quantifiables, :allowed_term_id, :integer
  end

  def self.down
    remove_column :non_quantifiables, :allowed_term_id
  end
end
