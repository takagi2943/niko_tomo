require "test_helper"

class Admin::GroupUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_group_users_index_url
    assert_response :success
  end
end
