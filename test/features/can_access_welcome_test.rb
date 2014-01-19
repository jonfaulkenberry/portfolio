require "test_helper"

class CanAccessWelcomeTest < Capybara::Rails::TestCase
  test "contains my name" do
    visit root_path
    assert_content page, "Jon Faulkenberry"
  end
end
