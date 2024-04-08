require "test_helper"

class Public::LabosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_labos_index_url
    assert_response :success
  end

  test "should get show" do
    get public_labos_show_url
    assert_response :success
  end
end
