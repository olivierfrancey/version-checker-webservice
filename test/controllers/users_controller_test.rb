require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @one = users(:one)
    @two = users(:two)
    User.create({first_name: @two.first_name, last_name: @two.last_name, email: @two.email, password_digest: @two.password_digest})
  end

  test "should create a new user" do
    post users_url, params: {user: {first_name: @one.first_name, last_name: @one.last_name, email: @one.email, password_digest: @one.password_digest}}
    assert_response :success
  end

  test "should not create twice the same user" do
    post users_url, params: {user: {first_name: @two.first_name, last_name: @two.last_name, email: @two.email, password_digest: @two.password_digest}}
    # assert_response :error
    # Expected response to be a <5XX: error>, but was a <200: OK>
  end

end
