require "test_helper"

feature "As a site owner, I want to be delete a project if it sucks" do
  scenario "delete a project" do
    sign_in
    visit portfolio_path
    portfolio_name = projects(:portfolio).name
    click_on portfolio_name
    click_on "Delete Project"
    visit portfolio_path
    page.wont_have_content portfolio_name
  end
end
