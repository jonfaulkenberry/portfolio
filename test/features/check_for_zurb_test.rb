require "test_helper"

feature "Check for Zurb Foundation" do
  scenario "Foundation is loaded in the homepage" do
    visit root_path
    page.has_css?("div.columns")
  end
end 

feature "Check for Zurb Theme" do
  scenario "Theme is loaded" do
    visit root_path
    page.has_css?("header.mathead")
  end
end
