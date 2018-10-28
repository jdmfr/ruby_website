require 'test_helper'

class UselessWelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get useless_welcome_index_url
    assert_response :success
  end

end
