require "test_helper"

feature "As a site owner, I want to delete any project" do
  background do
    sign_in_as_owner
    @project = create(:project)
  end
  scenario "delete a project successfully" do
    visit project_path(@project)
    click_on "Delete Project"
    page.has_content? "Project was successfully deleted"
    page.wont_have_content @project.name
  end
end
