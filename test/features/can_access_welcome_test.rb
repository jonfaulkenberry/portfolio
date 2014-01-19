require "test_helper"

class CanAccessWelcomeTest < Capybara::Rails::TestCase
  def test_homepage_has_content
      visit '/'
      assert page.has_content?("Home#index")
    end
end
