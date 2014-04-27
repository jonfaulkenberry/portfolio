require "test_helper"

feature "As a user, I want to view comments on a project" do
  background do
    @project = create(:project)
  end
  scenario "view project comments successfully" do
    visit project_path(@project)
    @project.comments.each do |comment|
      page.text.must_include comment.content
    end
  end
end
