require "test_helper"

class MotivationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get motivations_new_url
    assert_response :success
  end

  test "should get edit" do
    get motivations_edit_url
    assert_response :success
  end

  test "should get index" do
    get motivations_index_url
    assert_response :success
  end
end
