require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:john)
    post session_url, params: {email: user.email, password_digest: user.password_digest}
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

end
