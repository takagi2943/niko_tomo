require "test_helper"

class Public::MusicPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_music_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_music_posts_show_url
    assert_response :success
  end
end
