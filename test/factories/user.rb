FactoryGirl.define do
  factory :author, class: User do
    provider "twitter"
    sequence :uid do |n|
      n.to_s + Forgery(:basic).number(:at_least => 1000000, :at_most => 9999999).to_s
    end
    sequence :display_name do |n|
      n.to_s + Forgery(:name).full_name
    end
    sequence :username do |n|
      Forgery(:internet).user_name
    end
    role "author"
  end

  factory :owner, class: User do
    provider "twitter"
    sequence :uid do |n|
      n.to_s + Forgery(:basic).number(:at_least => 1000000, :at_most => 9999999).to_s
    end
    sequence :display_name do |n|
      n.to_s + Forgery(:name).full_name
    end
    sequence :password do |n|
      Forgery(:internet).user_name
    end
    role "owner"
  end
end