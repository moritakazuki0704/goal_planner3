require "test_helper"

class IdealsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ideals_new_url
    assert_response :success
  end

  test "should get show" do
    get ideals_show_url
    assert_response :success
  end

  test "should get edit" do
    get ideals_edit_url
    assert_response :success
  end
end
