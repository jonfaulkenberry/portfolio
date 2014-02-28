require "test_helper"

feature "As an author, I want to be able to sign out" do
  scenario "author signs out successfully" do
    sign_in_as_author
    click_on "Sign Out"
    page.has_content? "Signed out successfully"    
  end
end

feature "As an owner, I want to be able to sign out" do
  scenario "owner signs out successfully" do
    sign_in_as_owner
    click_on "Sign Out"
    page.has_content? "Signed out successfully"    
  end
end
