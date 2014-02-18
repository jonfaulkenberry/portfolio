require "test_helper"

feature "As a user, I want to be able to sign out so no one hacks me" do
  scenario "user signs up and then signs out" do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with:"test@test.com"
    fill_in "Password", with: "p@ssw0rd"
    fill_in "Password confirmation", with: "p@ssw0rd"    
    click_on "Sign up"
    page.must_have_content "signed up successfully"
    page.wont_have_content "a problem with your sign up"
    click_on "Sign Out"
    page.must_have_content "Signed out successfully"    
  end
end
