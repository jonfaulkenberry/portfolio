class Project < ActiveRecord::Base
  acts_as_taggable
  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }
end
