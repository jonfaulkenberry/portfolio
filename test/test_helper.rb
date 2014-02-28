ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
require "coveralls"

Coveralls.wear!

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  def sign_in_as_author
    @user = create(:author)
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on "Sign in"
  end

  def sign_in_as_owner
    @user = create(:owner)
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on "Sign in"
  end
end
