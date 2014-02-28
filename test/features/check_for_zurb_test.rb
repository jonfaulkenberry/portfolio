require "test_helper"

feature "As a developer I want to use Zurb Foundation" do
  scenario "Zurb Foundation is loaded" do
    visit root_path
    page.has_css?("div.columns")
  end
end 
