FactoryGirl.define do
  factory :post do
    author
    sequence :title do |n|
      n.to_s + Forgery(:lorem_ipsum).words(10, :random => true)
    end
    sequence :body do |n|
      n.to_s + Forgery(:lorem_ipsum).words(250, :random => true)
    end
    published true
    # Comments
    ignore do
      comments_count Forgery(:basic).number(:at_least => 0, :at_most => 25)
    end
    after(:create) do |post, evaluator|
      create_list(:comment, evaluator.comments_count, commentable_id: post.id, commentable_type: "Post")
    end
  end
end