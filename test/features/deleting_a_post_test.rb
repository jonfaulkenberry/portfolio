require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # When I visit the posts index
    visit posts_path
    # And delete a post
    http_post_title = posts(:http).title
    click_link("Destroy", :match => :first)
    # The post should no longer exist
    page.wont_have_content http_post_title
  end
end
