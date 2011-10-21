class RenameCodeVersionInLexiconTerms < ActiveRecord::Migration
  def self.up
    rename_column :lexicon_terms, :codeVersion, :codingSchemeVersion
  end

  def self.down
    rename_column :lexicon_terms, :codingSchemeVersion, :codeVersion
  end
end
