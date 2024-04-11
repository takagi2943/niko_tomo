require "test_helper"

class Public::GroupMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_group_messages_create_url
    assert_response :success
  end
end
