class AddAnatomicEntityIdToAllowedTerms < ActiveRecord::Migration
  def self.up
    add_column :allowed_terms, :anatomic_entity_id, :integer
  end

  def self.down
    remove_column :allowed_terms, :anatomic_entity_id
  end
end
