require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    sign_in
    visit blog_path
    http_post_title = posts(:http).title
    click_on http_post_title
    click_on "Delete Post"
    visit blog_path
    page.wont_have_content http_post_title
  end
end
