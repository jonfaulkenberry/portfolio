class User < ActiveRecord::Base
  has_many :posts, foreign_key: "author_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :omniauthable, :omniauth_providers => [:twitter]

  def owner?
    role == "owner"
  end

  def author?
    ["owner", "author"].include? role
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

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end
end
