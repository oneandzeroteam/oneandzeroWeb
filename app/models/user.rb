class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :borrowablestuffs

  validates :student_number, :presence => true
  validates :name,  presence: true
  validates :department_name, presence: true
  validates :entry_semester, presence: true
  validates :kakaotalkid, presence: true
  validates :profile_image_url, presence: true
end