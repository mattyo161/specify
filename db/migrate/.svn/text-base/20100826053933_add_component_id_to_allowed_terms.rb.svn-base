class AddComponentIdToAllowedTerms < ActiveRecord::Migration
  def self.up
    add_column :allowed_terms, :component_id, :integer
  end

  def self.down
    remove_column :allowed_terms, :component_id
  end
end
