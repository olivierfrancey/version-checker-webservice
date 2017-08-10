require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:one))
    @project = projects(:one)
  end

  test "should get index" do
    get projects_path
    assert_response :redirect
  end

  test "should create a new project" do
    post projects_url, params: {project: @project}
    assert_response :redirect
  end

end
