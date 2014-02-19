require "test_helper"

feature "As a user, I want to be able to sign out so no one hacks me" do
  scenario "user signs in with an existing account and then signs out" do
    sign_in
    click_on "Sign Out"
    page.has_content? "Signed out successfully"    
  end
end
