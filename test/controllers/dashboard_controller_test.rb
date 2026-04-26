require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get client" do
    get dashboard_client_url
    assert_response :success
  end
end
