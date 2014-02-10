require "test_helper"

feature "As a site owner, I want to be delete a project if it sucks" do
  scenario "delete a project" do
    # When I visit the posts index
    visit projects_path
    # And delete a post
    portfolio_name = projects(:portfolio).name
    click_link("Destroy", :match => :first)
    # The post should no longer exist
    page.wont_have_content portfolio_name
  end
end
