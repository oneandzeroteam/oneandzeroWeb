class Post < ApplicationRecord
  searchkick

  belongs_to :user
  belongs_to :board

  validates :user,  :presence => true
  validates :title, :presence => true

  has_many :comments, :dependent => :destroy

  #image uploader
  has_many :attachments
end
