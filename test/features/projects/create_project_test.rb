require "test_helper"

feature "As a site owner, I want to create a project" do
  background do
    sign_in_as_owner
    @name = Forgery(:lorem_ipsum).words(10, :random => true)
    @description = Forgery(:lorem_ipsum).words(10, :random => true)
    @body = Forgery(:lorem_ipsum).words(50, :random => true)
  end
  scenario "create a new project successfully" do
    visit manage_path
    click_on "New project"
    fill_in "Name", with: @name
    fill_in "Description", with: @description
    fill_in "Body", with: @body
    click_on "Create Project"
    page.html.must_include "Project has been created"
    page.text.must_include @name
    page.text.must_include @body
  end
  
  scenario "new project form has invalid data" do
    visit manage_path
    click_on "New project"
    fill_in "Name", with: "Q"
    click_on "Create Project"
    page.has_content? "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Body can't be blank"
    page.text.must_include "Description can't be blank"
  end
end
