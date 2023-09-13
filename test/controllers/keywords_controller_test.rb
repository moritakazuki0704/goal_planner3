require "test_helper"

class KeywordsControllerTest < ActionDispatch::IntegrationTest
  test "should get introduction" do
    get keywords_introduction_url
    assert_response :success
  end

  test "should get new" do
    get keywords_new_url
    assert_response :success
  end
end
