require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get sketch" do
    get :sketch
    assert_response :success
  end

end
