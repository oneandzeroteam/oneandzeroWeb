require 'test_helper'

class PostAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_attachment = post_attachments(:one)
  end

  test "should get index" do
    get post_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_post_attachment_url
    assert_response :success
  end

  test "should create post_attachment" do
    assert_difference('PostAttachment.count') do
      post post_attachments_url, params: { post_attachment: { image_url: @post_attachment.image_url, post_id: @post_attachment.post_id } }
    end

    assert_redirected_to post_attachment_url(PostAttachment.last)
  end

  test "should show post_attachment" do
    get post_attachment_url(@post_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_attachment_url(@post_attachment)
    assert_response :success
  end

  test "should update post_attachment" do
    patch post_attachment_url(@post_attachment), params: { post_attachment: { image_url: @post_attachment.image_url, post_id: @post_attachment.post_id } }
    assert_redirected_to post_attachment_url(@post_attachment)
  end

  test "should destroy post_attachment" do
    assert_difference('PostAttachment.count', -1) do
      delete post_attachment_url(@post_attachment)
    end

    assert_redirected_to post_attachments_url
  end
end
