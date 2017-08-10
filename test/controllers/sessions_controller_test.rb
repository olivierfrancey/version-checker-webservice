require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should create a new session as user" do
    sign_in_as(users(:one))
    assert_response :success
  end

  test "should create a new session as superAdmin" do
    sign_in_as(users(:two))
    assert_response :success
  end

  test "should destroy a session" do
    delete session_path
    assert_response :redirect
  end

end
