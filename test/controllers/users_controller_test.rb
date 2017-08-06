require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "sould create a new user" do
    user = users(:john)
    
    assert_difference('User.count') do
       post users_url(user)
    end
    assert_redirected_to new_session_path
  end
  
end
