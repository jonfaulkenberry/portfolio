class Post < ActiveRecord::Base
  extend FriendlyId
  has_many :comments, as: :commentable
  
  friendly_id :title, :use => [:slugged, :history]
  belongs_to :author, class_name: "User"
  validates :title, length: { in: 4..255 }
  validates_presence_of :body, :on => :create, :message => "can't be blank"

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
