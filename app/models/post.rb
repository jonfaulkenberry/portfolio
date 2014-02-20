class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]

  belongs_to :author, class_name: "User"

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
