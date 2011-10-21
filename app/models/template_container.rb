class TemplateContainer < ActiveRecord::Base
 has_and_belongs_to_many :aim_templates, :uniq => true #, :dependent => :destroy
 belongs_to :user
end
