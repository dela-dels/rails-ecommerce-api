require "test_helper"

class ProductOptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_options_index_url
    assert_response :success
  end

  test "should get new" do
    get product_options_new_url
    assert_response :success
  end

  test "should get show" do
    get product_options_show_url
    assert_response :success
  end

  test "should get update" do
    get product_options_update_url
    assert_response :success
  end

  test "should get destroy" do
    get product_options_destroy_url
    assert_response :success
  end
end
