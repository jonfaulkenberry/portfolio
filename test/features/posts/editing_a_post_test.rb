require "test_helper"

feature "As an author, I want to edit a post" do
  background do
    sign_in_as_author
    @post = create(:post)
  end
  scenario "edit an existing post successfully" do
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
