require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "AOV"
  end
end
