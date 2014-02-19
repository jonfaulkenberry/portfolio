require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do
    sign_in
    visit blog_path
    click_link posts(:http).title
    click_on "Edit Post"
    updated_title = "Becoming a Web Developer"
    fill_in "Title", with: updated_title
    click_on "Update Post"
    page.has_content? "Post was successfully updated"
    visit blog_path
    page.text.must_include updated_title
  end
end
