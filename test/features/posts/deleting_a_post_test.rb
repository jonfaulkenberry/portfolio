require "test_helper"

feature "As an owner, I want to delete a post" do
  background do
    sign_in_as_owner
    @post = create(:post)
  end
  scenario "post is deleted successfully" do
    visit post_path(@post)
    click_on "Delete Post"
    page.has_content? "Post was successfully deleted."
    page.wont_have_content @post.title
  end
end
