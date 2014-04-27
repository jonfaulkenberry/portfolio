FactoryGirl.define do
  factory :project do
    sequence :name do |n|
      n.to_s + Forgery(:lorem_ipsum).words(10, :random => true)
    end
    sequence :technologies_used do |n|
      n.to_s + Forgery(:lorem_ipsum).words(10, :random => true)
    end
    # Comments
    ignore do
      comments_count Forgery(:basic).number(:at_least => 0, :at_most => 25)
    end
    after(:create) do |project, evaluator|
      create_list(:comment, evaluator.comments_count, commentable_id: project.id, commentable_type: "Project")
    end
  end
end