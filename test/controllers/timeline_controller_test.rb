require 'test_helper'

class TimelineControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get timeline_show_url
    assert_response :success
  end

  test "should get insert" do
    get timeline_insert_url
    assert_response :success
  end

  test "should get update" do
    get timeline_update_url
    assert_response :success
  end

  test "should get delete" do
    get timeline_delete_url
    assert_response :success
  end

end
