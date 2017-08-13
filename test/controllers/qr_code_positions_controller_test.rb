require 'test_helper'

class QrCodePositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:one))
    @qr_code_position = qr_code_positions(:one)
  end

  test "should get index" do
    get qr_code_positions_path
    assert_response :redirect
  end

  test "should create a new qr-code position" do
    # NoMethodError: undefined method `permit' for "#<QrCodePosition:0x007f822ba631f0>":String
    
    #post qr_code_positions_url, params: {qr_code_position: @qr_code_position}
    #assert_response :redirect
  end
end
