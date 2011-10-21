class AddCodeVersionToLexiconTerms < ActiveRecord::Migration
  def self.up
    add_column :lexicon_terms, :codeVersion, :string
  end

  def self.down
    remove_column :lexicon_terms, :codeVersion
  end
end
