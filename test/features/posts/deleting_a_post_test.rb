require "test_helper"

feature "As an owner, I want to delete any post" do
  background do
    sign_in_as_owner
  end
  scenario "owner can delete own posts" do
    @post = create(:post, author: @user)
    visit post_path(@post)
    click_on "Delete Post"
    page.has_content? "Post was successfully deleted."
    page.wont_have_content @post.title                    
  end 
  scenario "owner can delete another users posts" do
    @post = create(:post, author: @user)
    visit post_path(@post)
    click_on "Delete Post"
    page.has_content? "Post was successfully deleted."
    page.wont_have_content @post.title                    
  end 
end

feature "As a visitor, I should not be able to delete any posts" do
  background do
    @post = create(:post)
  end
  scenario "visitor cannot delete a post" do
    visit post_path(@post)
    page.text.wont_include "Delete Post"
  end
end
