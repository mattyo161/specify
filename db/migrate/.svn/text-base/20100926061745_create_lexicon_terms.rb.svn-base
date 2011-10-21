class CreateLexiconTerms < ActiveRecord::Migration
  def self.up
    create_table :lexicon_terms do |t|
      t.string :codeMeaning
      t.string :codeValue
      t.string :codingSchemeDesignator
      t.text :description
      t.integer :lexicon_term_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lexicon_terms
  end
end
