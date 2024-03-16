require "test_helper"

class DayTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get day_types_show_url
    assert_response :success
  end
end
