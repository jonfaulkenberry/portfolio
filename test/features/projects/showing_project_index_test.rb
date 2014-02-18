require "test_helper"

feature "Projects::ShowingProjectIndex" do
  scenario "the test is sound" do
    visit projects_path
    page.text.must_include projects(:portfolio).name
  end
end
