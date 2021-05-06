require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get product_details" do
    get products_product_details_url
    assert_response :success
  end
end
