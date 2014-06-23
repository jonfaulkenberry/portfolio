require "test_helper"

feature "As a site owner, I want to edit a project" do
  background do
    sign_in_as_owner
    @project = create(:project)
    @name = Forgery(:lorem_ipsum).words(10, :random => true)
    @description = Forgery(:lorem_ipsum).words(10, :random => true)
    @body = Forgery(:lorem_ipsum).words(50, :random => true)
  end 
  scenario "edit a project successfully" do
    visit edit_project_path(@project)
    fill_in "Name", with: @name
    fill_in "Body", with: @body
    click_on "Update Project"
    page.html.must_include "Project was successfully updated."
    page.text.must_include @name
    page.text.must_include @body 
    page.text.wont_include @project.name
    page.text.wont_include @project.body
  end
  scenario "incorrectly editing an existing project" do
    visit edit_project_path(@project)
    fill_in "Name", with: "Err"
    click_on "Update Project"
    page.text.must_include "Name is too short"
  end
end
