FactoryGirl.define do
  factory :comment do
    sequence :content do |n|
      n.to_s + Forgery(:lorem_ipsum).words(10, :random => true)
    end
  end
end