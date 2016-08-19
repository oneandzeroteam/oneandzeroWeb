class PostAttachment < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :post
end
