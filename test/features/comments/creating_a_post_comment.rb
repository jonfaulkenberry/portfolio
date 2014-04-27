require "test_helper"

feature "As a user, I want to create a comment on a post" do
  background do
    @post = create(:post)
  end
  scenario "creates post comment successfully" do
    visit post_path(@post)
    fill_in "content", Forgery(:lorem_ipsum).words(10, :random => true)
    click_on "Create Comment"
    page.has_content? "Comment created."
  end
end
