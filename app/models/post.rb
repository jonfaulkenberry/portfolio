class Post < ActiveRecord::Base
  extend FriendlyId
  acts_as_taggable
  friendly_id :title, :use => [:slugged, :history]
  belongs_to :author, class_name: "User"
  validates :title, length: { in: 4..255 }
  validates_presence_of :body, :on => :create, :message => "can't be blank"

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
  searchable do
    string :title
    text :description, :body, :tag_list
    date :created_at
    boolean :published
  end
end
