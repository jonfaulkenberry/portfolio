require "test_helper"

feature "As an author, I want to be able to sign in" do
  scenario "author signs in with valid credentials" do
    sign_in_as_author
    page.has_content? "Signed in successfully"
  end
  scenario "author attempts to sign in with invalid credentials" do
    visit new_user_session_path
    fill_in "Email", with: Forgery(:internet).email_address
    fill_in "Password", with: Forgery(:basic).password(:at_least => 8, :at_most => 128, :random => true)
    click_on "Sign in"
    page.has_content? "Invalid email or password"
  end
end

feature "As an owner, I want to be able to sign in" do
  scenario "owner signs in with valid credentials" do
    sign_in_as_owner
    page.has_content? "Signed in successfully"
  end
  scenario "owner attempts to sign in with invalid credentials" do
    visit new_user_session_path
    fill_in "Email", with: Forgery(:internet).email_address
    fill_in "Password", with: Forgery(:basic).password(:at_least => 8, :at_most => 128, :random => true)
    click_on "Sign in"
    page.has_content? "Invalid email or password"
  end
end
