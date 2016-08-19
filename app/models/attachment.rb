class Attachment < ApplicationRecord
  mount_uploader :image_url, ImageUploader

  belongs_to :post
  belongs_to :timeline
  belongs_to :borrowablestuff
  belongs_to :member
  belongs_to :project
end
