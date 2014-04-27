require "test_helper"

feature "As a user, I want to create a comment on a project" do
  background do
    @post = create(:project)
  end
  scenario "creates project comment successfully" do
    visit project_path(@project)
    fill_in "content", Forgery(:lorem_ipsum).words(10, :random => true)
    click_on "Create Comment"
    page.has_content? "Comment created."
  end
end
