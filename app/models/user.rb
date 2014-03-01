class User < ActiveRecord::Base
  has_many :posts, foreign_key: "author_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  if Rails.env.production?
   devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  else
   devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable 
  end
  
  def owner?
    role == "owner"
  end
  
  def author?
    ["owner", "author"].include? role
  end
end
