require 'test_helper'

class QrCodePositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qr_code_position = qr_code_positions(:one)
  end

  test "should get index" do
    get qr_code_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_qr_code_position_url
    assert_response :success
  end

  test "should create qr_code_position" do
    assert_difference('QrCodePosition.count') do
      post qr_code_positions_url, params: { qr_code_position: { name: @qr_code_position.name, page: @qr_code_position.page, size: @qr_code_position.size, x: @qr_code_position.x, y: @qr_code_position.y } }
    end

    assert_redirected_to qr_code_position_url(QrCodePosition.last)
  end

  test "should show qr_code_position" do
    get qr_code_position_url(@qr_code_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_qr_code_position_url(@qr_code_position)
    assert_response :success
  end

  test "should update qr_code_position" do
    patch qr_code_position_url(@qr_code_position), params: { qr_code_position: { name: @qr_code_position.name, page: @qr_code_position.page, size: @qr_code_position.size, x: @qr_code_position.x, y: @qr_code_position.y } }
    assert_redirected_to qr_code_position_url(@qr_code_position)
  end

  test "should destroy qr_code_position" do
    assert_difference('QrCodePosition.count', -1) do
      delete qr_code_position_url(@qr_code_position)
    end

    assert_redirected_to qr_code_positions_url
  end
end
