require "test_helper"

feature "As an author, I want to create a new post" do
  background do
    sign_in_as_author
  end
  scenario "submit form data to create a new post" do
    visit manage_path
    title = Forgery(:lorem_ipsum).words(10, :random => true)
    body  = Forgery(:lorem_ipsum).words(250, :random => true)
    click_on "New post"
    fill_in "Title", with: title
    fill_in "Body",  with: body
    click_on "Create Post"
    page.has_content? "Post was successfully created"
    page.text.must_include title
    page.text.must_include body
    page.has_css? "#author"
    page.text.must_include @user.email
  end
end
