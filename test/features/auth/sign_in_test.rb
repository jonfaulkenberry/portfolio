require "test_helper"

feature "As a user, I want to be able to sign in so I can make changes" do
  scenario "user signs in with existing account" do
    sign_in
    page.must_have_content "Signed in successfully"
    page.wont_have_content "Invalid email or password"
  end
end
