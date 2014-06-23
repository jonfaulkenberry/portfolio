require "test_helper"

feature "As a visitor, I want to view a project" do
  background do
    @project = create(:project)
  end
  scenario "view a project successfully using project url" do
    visit project_path(@project)
    page.text.must_include @project.name
    page.text.must_include @project.body
  end
end
