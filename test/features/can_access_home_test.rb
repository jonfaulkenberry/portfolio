require "test_helper"

feature "can access the hompeage" do
  scenario "homepage contains my name" do
    visit root_path
    page.must_have_content "Jon Faulkenberry"
  end
end


