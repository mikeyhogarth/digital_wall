require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_redirected_to log_in_path
  end

  test "should get destroy" do
    get :destroy
    assert_redirected_to root_url
  end

end
