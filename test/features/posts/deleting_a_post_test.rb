require "test_helper"

feature "Deleting posts" do
  background do
    @post = create(:post)
  end
  scenario "allows owners to delete posts" do
    sign_in_as_owner
    @post = create(:post, author: @user)
    visit post_path(@post)
    click_on "Delete Post"
    page.has_content? "Post was successfully deleted."
    page.wont_have_content @post.title                    
  end 
  scenario "does not allow a visitor to delete a post" do
    visit post_path(@post)
    page.text.wont_include "Delete Post"
  end
end
