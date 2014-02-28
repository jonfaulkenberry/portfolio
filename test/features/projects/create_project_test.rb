require "test_helper"

feature "As a site owner, I want to create a project" do
  background do
    sign_in_as_owner
    @name = Forgery(:lorem_ipsum).words(10, :random => true)
    @tech_used = Forgery(:lorem_ipsum).words(10, :random => true)
  end
  scenario "create a new project successfully" do
    visit manage_path
    click_on "New project"
    fill_in "Name", with: @name
    fill_in "Technologies used", with: @tech_used
    click_on "Create Project"
    page.html.must_include "Project has been created"
    page.text.must_include @name
    page.text.must_include @tech_used
  end
  
  scenario "new project form has invalid data" do
    visit manage_path
    click_on "New project"
    fill_in "Name", with: "Q"
    click_on "Create Project"
    page.has_content? "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
