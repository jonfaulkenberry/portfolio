class User < ActiveRecord::Base
  
  has_many :posts, foreign_key: "author_id"
  
  devise :database_authenticatable, :rememberable, :omniauthable, :omniauth_providers => [:twitter]

  def owner?
    role == "owner"
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.role = "viewer"
      user.display_name = auth.info.name
      user.username = auth.info.nickname
     end
  end
end
