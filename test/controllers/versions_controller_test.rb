require 'test_helper'

class VersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:one))
    @version = versions(:one)
  end

  test "should get index" do
    get versions_path
    assert_response :redirect
  end

  test "should create a new version" do
    post versions_url, params: {version: @version}
    assert_response :redirect
  end

  test "should show version" do
    get version_url(@version)
    assert_response :redirect
  end

  test "should delete a version" do
    delete version_url(@version)
    assert_response :redirect
  end
  
end
