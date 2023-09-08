require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get dash_board" do
    get users_dash_board_url
    assert_response :success
  end

  test "should get withdrawal" do
    get users_withdrawal_url
    assert_response :success
  end
end
