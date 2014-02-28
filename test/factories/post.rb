FactoryGirl.define do
  factory :post do
    author
    sequence :title do |n|
      n.to_s + Forgery(:lorem_ipsum).words(10, :random => true)
    end
    sequence :body do |n|
      n.to_s + Forgery(:lorem_ipsum).words(250, :random => true)
    end
  end
end