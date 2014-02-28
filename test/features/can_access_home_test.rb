require "test_helper"

feature "As a visitor, I want to be able access the homepage" do
  scenario "root path returns status code 200" do
    visit root_path
    page.status_code.must_equal 200
  end
end

feature %q{As a visitor, I want to be able access the homepage
   via public domain} do
  scenario "www.jonfaulkenberry.com returns status code 200" do
    visit "http://www.jonfaulkenberry.com"
    page.status_code.must_equal 200
  end
end
