require "test_helper"

feature "As the site owner, I want to create a project so I can show off my work" do
  scenario "submit form data to create new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: "My first project"
    fill_in "Technologies used", with: "Rails 4"
    
    click_on "Create Project"
    
    page.text.must_include "Project has been created"
    page.text.must_include "My first project"
    page.text.must_include "Rails 4"
  end
end
