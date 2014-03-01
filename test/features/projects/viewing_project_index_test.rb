require "test_helper"

feature "As a visitor, I want to view the portfolio page" do
  background do
    @project = create(:project)
  end
  scenario "view portfolio page successfully" do
    visit projects_path
    page.text.must_include @project.name
    page.text.must_include @project.technologies_used
  end
end
