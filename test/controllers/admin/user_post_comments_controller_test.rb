require "test_helper"

class Admin::UserPostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_post_comments_index_url
    assert_response :success
  end
end
