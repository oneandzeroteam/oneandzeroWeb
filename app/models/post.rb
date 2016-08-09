class Post < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :user,  :presence => true
  validates :title, :presence => true

  has_many :comments, :dependent => :destroy
end
