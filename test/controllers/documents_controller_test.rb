require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:one))
    @document = documents(:one)
  end

  test "should get index" do
    get documents_path
    assert_response :redirect
  end

  test "should create a new document" do
    post documents_url, params: {document: @document}
    assert_response :redirect
  end
  
end
