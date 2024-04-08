require "test_helper"

class Admin::MusicPostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_music_post_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_music_post_comments_show_url
    assert_response :success
  end
end
