class AddCodingSchemeVersionToAllowedTerms < ActiveRecord::Migration
  def self.up
    add_column :allowed_terms, :codingSchemeVersion, :string
  end

  def self.down
    remove_column :allowed_terms, :codingSchemeVersion
  end
end
