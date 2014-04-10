require "test_helper"

feature "As an author, I want to be able to sign in" do
  scenario "author signs in with valid credentials" do
    sign_in_as_author
    page.has_content? "Signed in successfully"
  end
end

feature "As an owner, I want to be able to sign in" do
  scenario "owner signs in with valid credentials" do
    sign_in_as_owner
    page.has_content? "Signed in successfully"
  end
end
