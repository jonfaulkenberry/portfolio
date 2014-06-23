require "test_helper"

feature "Signing in" do
  scenario "signs a viewer in successfully" do
    sign_in_as_viewer
    page.has_content? "Signed in successfully"
  end
  
  scenario "signs an owner in successfully" do
    sign_in_as_owner
    page.has_content? "Signed in successfully"
  end
  
  scenario "signs a new user in successfully" do
    OmniAuth.config.add_mock(:twitter, {:uid => Forgery(:basic).number(:at_least => 1000000, :at_most => 9999999).to_s})
    visit root_path
    click_on "Sign In with Twitter"
    page.has_content? "Signed in successfully"
  end
end
