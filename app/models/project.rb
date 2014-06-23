class Project < ActiveRecord::Base
  acts_as_taggable
  validates :description, presence: true
  validates :body, presence: true
  validates :name, length: { in: 4..255 }
end
