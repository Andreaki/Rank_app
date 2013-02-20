require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get login,home,profile,setting" do
    get :login,home,profile,setting
    assert_response :success
  end

end
