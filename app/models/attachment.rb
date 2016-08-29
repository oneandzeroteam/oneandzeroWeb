class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  belongs_to :post
  belongs_to :timeline
  belongs_to :borrowablestuff
  belongs_to :member
  belongs_to :project
end
