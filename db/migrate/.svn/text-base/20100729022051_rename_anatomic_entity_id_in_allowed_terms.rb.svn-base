class RenameAnatomicEntityIdInAllowedTerms < ActiveRecord::Migration
	def self.up
		rename_column :allowed_terms, :anatomic_entity_id, :anatomic_entity_characteristic_id
	end

	def self.down
		rename_column :allowed_terms, :anatomic_entity_characteristic_id, :anatomic_entity_id
	end
end
