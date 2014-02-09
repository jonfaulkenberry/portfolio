require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do
    # When I update a post
    visit posts_path
    click_link("Show", :match => :first)
    click_on "Edit"
    updated_title = "Becoming a Web Developer"
    fill_in "Title", with: updated_title
    click_on "Update Post"
    # The post should contain the updated values
    page.text.must_include "Post was successfully updated"
    page.text.must_include updated_title
  end
end
