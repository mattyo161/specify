class AddLexiconNameToLexiconTerms < ActiveRecord::Migration
  def self.up
    add_column :lexicon_terms, :lexiconName, :string
  end

  def self.down
    remove_column :lexicon_terms, :lexiconName
  end
end
