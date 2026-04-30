require "test_helper"

class Admin::DietsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_diets_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_diets_create_url
    assert_response :success
  end
end
