require "test_helper"

feature "As a site owner, I would like to be able to view a project so I can evaluate it" do
  scenario "view a project" do
    visit project_path(projects(:portfolio).id)
    page.text.must_include projects(:portfolio).name
  end
end
