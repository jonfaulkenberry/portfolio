FactoryGirl.define do
  factory :project do
    sequence :name do |n|
      n.to_s + Forgery(:lorem_ipsum).words(10, :random => true)
    end
    sequence :description do |n|
      n.to_s + Forgery(:lorem_ipsum).words(10, :random => true)
    end
    sequence :body do |n|
      n.to_s + Forgery(:lorem_ipsum).words(10, :random => true)
    end
  end
end