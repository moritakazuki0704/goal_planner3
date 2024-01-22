require "test_helper"

class CommitsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get commits_new_url
    assert_response :success
  end

  test "should get index" do
    get commits_index_url
    assert_response :success
  end

  test "should get show" do
    get commits_show_url
    assert_response :success
  end
end
