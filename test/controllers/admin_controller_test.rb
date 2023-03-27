require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get order_histories" do
    get admin_order_histories_url
    assert_response :success
  end
end
