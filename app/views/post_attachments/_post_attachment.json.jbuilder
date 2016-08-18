json.extract! post_attachment, :id, :post_id, :image_url, :created_at, :updated_at
json.url post_attachment_url(post_attachment, format: :json)