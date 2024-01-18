require "test_helper"

class ScrapBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get scrap_books_new_url
    assert_response :success
  end

  test "should get index" do
    get scrap_books_index_url
    assert_response :success
  end

  test "should get show" do
    get scrap_books_show_url
    assert_response :success
  end
end
