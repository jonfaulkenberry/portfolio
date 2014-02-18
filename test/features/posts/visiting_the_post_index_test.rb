require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts, show list" do
    visit blog_path
    page.text.must_include posts(:cr).title
  end
end
