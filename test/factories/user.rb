FactoryGirl.define do
  factory :author, class: User do
    sequence :email do |n|
      n.to_s + Forgery(:internet).email_address
    end
    sequence :password do |n|
      Forgery(:basic).password(:at_least => 8, :at_most => 128, :random => true)
    end
    role "author"
  end

  factory :owner, class: User do
    sequence :email do |n|
      n.to_s + Forgery(:internet).email_address
    end
    sequence :password do |n|
      Forgery(:basic).password(:at_least => 8, :at_most => 128, :random => true)
    end
    role "owner"
  end
end