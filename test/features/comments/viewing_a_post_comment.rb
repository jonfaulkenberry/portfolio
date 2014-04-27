require "test_helper"

feature "As a user, I want to view comments on a post" do
  background do
    @post = create(:post)
  end
  scenario "view post comments successfully" do
    visit post_path(@post)
    @post.comments.each do |comment|
      page.text.must_include comment.content
    end
  end
end
