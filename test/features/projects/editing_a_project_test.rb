require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typos" do
  scenario "editing an existing project" do
    sign_in
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "My Rad Portfolio"
    click_on "Update Project"
    page.html.must_include "successfully"
    page.text.must_include "Rad Portfolio"
    page.text.wont_include "Code Fellows Portfolio"
  end
  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Err"
    click_on "Update Project"
    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end
end
