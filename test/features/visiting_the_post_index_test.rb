require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts, show list" do
    # When I visit /posts
    visit posts_path
    # Then the existing posts should show
    page.text.must_include posts(:cr).title
  end
end
