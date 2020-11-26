require 'test_helper'

class BasketControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get basket_show_url
    assert_response :success
  end

end
