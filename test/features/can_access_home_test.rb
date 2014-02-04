require "test_helper"

feature "can access the hompeage" do
  scenario "homepage contains my name" do
    visit root_path
    page.must_have_content "Jon Faulkenberry"
  end
end

feature "can access the hompeage via public domain" do
  scenario "www.jonfaulkenberry.com contains my name" do
    visit "http://www.jonfaulkenberry.com"
    page.must_have_content "Jon Faulkenberry"
  end
end


