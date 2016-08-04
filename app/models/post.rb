class Post < ApplicationRecord
  belongs_to :user

  class Post < ActiveRecord::Base
    validates :user,  :presence => true
    validates :title, :presence => true
                    #,:length => { :minimum => 5 } # 추후 수정편하도록 삭제안함.
  end
  has_many :comments, :dependent => :destroy
end
