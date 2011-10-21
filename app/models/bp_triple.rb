class BpTriple < ActiveRecord::Base
  belongs_to :domain, :class_name => "BpTerm",
    :foreign_key => "domain"
  belongs_to :range, :class_name => "BpTerm",
    :foreign_key => "range"
end
