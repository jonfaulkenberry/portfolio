require "test_helper"

feature "As a site owner, I want to edit a project" do
  background do
    sign_in_as_owner
    @project = create(:project)
    @name = Forgery(:lorem_ipsum).words(10, :random => true)
    @tech_used = Forgery(:lorem_ipsum).words(10, :random => true)
  end 
  scenario "edit a project successfully" do
    visit edit_project_path(@project)
    fill_in "Name", with: @name
    fill_in "Technologies used", with: @tech_used
    click_on "Update Project"
    page.html.must_include "Project was successfully updated."
    page.text.must_include @name
    page.text.must_include @tech_used 
    page.text.wont_include @project.name
    page.text.wont_include @project.technologies_used
  end
  scenario "incorrectly editing an existing project" do
    visit edit_project_path(@project)
    fill_in "Name", with: "Err"
    click_on "Update Project"
    page.text.must_include "Name is too short"
  end
end
