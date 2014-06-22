require "test_helper"

feature "As an owner, I want to edit any post" do
  background do
    sign_in_as_owner
  end
  scenario "owner edits own post successfully" do
    @post = create(:post, author: @user)
    visit post_path(@post)
    click_on "Edit Post"
    title = Forgery(:lorem_ipsum).words(10, :random => true)
    body  = Forgery(:lorem_ipsum).words(250, :random => true)
    fill_in "Title", with: title
    fill_in "Body", with: body
    click_on "Update Post"
    page.has_content? "Post was successfully updated"
    page.text.wont_include @post.title
    page.text.wont_include @post.body
    page.text.must_include title
    page.text.must_include body
  end
end

feature "As a visitor, I cannot edit any post" do
  background do
    @post = create(:post)
  end
  scenario "visitor is not able to edit a post" do
    visit post_path(@post)
    page.text.wont_include "Edit Post"
  end
end
