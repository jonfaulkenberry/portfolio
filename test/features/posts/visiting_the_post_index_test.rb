require "test_helper"

feature "As a visitor I want to view the blog page" do
  background do
    @post = create(:post)
  end
  scenario "view blog page successfully" do
    visit blog_path
    page.text.must_include @post.title
  end
end
