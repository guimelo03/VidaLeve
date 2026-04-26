require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get onboarding" do
    get users_onboarding_url
    assert_response :success
  end
end
