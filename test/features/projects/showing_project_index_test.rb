require "test_helper"

feature "Projects::ShowingProjectIndex" do
  scenario "the test is sound" do
    # When I visit /posts
    visit projects_path
    # Then the existing posts should show
    page.text.must_include projects(:portfolio).name
  end
end
