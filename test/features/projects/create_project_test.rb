require "test_helper"

feature "As the site owner, I want to create a project so I can show off my work" do
  scenario "submit form data to create new project" do
    sign_in
    visit manage_path
    click_on "New project"
    fill_in "Name", with: "My first project"
    fill_in "Technologies used", with: "Rails 4"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "My first project"
    page.text.must_include "Rails 4"
  end
  
  scenario "new project form has invalid data" do
    sign_in
    visit manage_path
    click_on "New project"
    fill_in "Name", with: "Q"
    click_on "Create Project"
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
