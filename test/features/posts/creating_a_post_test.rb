require "test_helper"

feature "As an owner, I want to create and publish posts" do
  background do
    sign_in_as_owner
  end
  scenario "owner creates a new post" do
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
    page.text.must_include @user.display_name
    page.text.must_include "Status: Unpublished"
  end
  scenario "owner publishes a new post" do
    visit new_post_path
    page.must_have_field('Published')
    fill_in "Title", with: Forgery(:lorem_ipsum).words(10, :random => true)
    fill_in "Body", with: Forgery(:lorem_ipsum).words(250, :random => true)
    check "Published"
    click_on "Create Post"
    page.text.must_include "Status: Published"
  end
end

feature "As an author, I want to create but not publish posts" do
  background do
    sign_in_as_author
  end
  scenario "author creates a new post" do
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
    page.text.must_include @user.display_name
    page.text.must_include "Status: Unpublished"
  end
  scenario "author cannot publish posts" do
    visit new_post_path
    page.wont_have_field('Published')
  end
end
