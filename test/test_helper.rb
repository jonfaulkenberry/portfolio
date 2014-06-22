require "coveralls"
Coveralls.wear!('rails')

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  
  OmniAuth.config.test_mode = true

  def sign_in_as_viewer
    @user = create(:viewer)
    OmniAuth.config.add_mock(:twitter, {:uid => @user.uid})
    visit root_path
    click_on "Sign In with Twitter"
  end

  def sign_in_as_owner
    @user = create(:owner)
    OmniAuth.config.add_mock(:twitter, {:uid => @user.uid})
    visit root_path
    click_on "Sign In with Twitter"
  end
end
