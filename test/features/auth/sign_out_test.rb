require "test_helper"

feature "Signing out" do
  scenario "signs a viewer out successfully" do
    sign_in_as_viewer
    click_on "Sign Out"
    page.has_content? "Signed out successfully"    
  end
  
  scenario "signs a owner out successfully" do
    sign_in_as_owner
    click_on "Sign Out"
    page.has_content? "Signed out successfully"    
  end
  
  scenario "signs a new user out successfully" do
    OmniAuth.config.add_mock(:twitter, {:uid => Forgery(:basic).number(:at_least => 1000000, :at_most => 9999999).to_s})
    visit root_path
    click_on "Sign In with Twitter"
    page.has_content? "Signed in successfully"
    click_on "Sign Out"
    page.has_content? "Signed out successfully"    
  end
end
