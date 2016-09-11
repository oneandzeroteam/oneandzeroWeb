class Member < ApplicationRecord
  # mount_uploader :image_url, AvatarUploader

  searchkick

  def search_data
    {
        name: name,
        image_url: image_url,
        occupation: occupation,
        email: email,
        description: description
    }
  end

  self.per_page = 8


	has_one :user
  has_one :attachment

  def add_linkage_with_user(user)
    self.user_id = user.id
    return self.save
  end

  def find_pairUser(m_email)
    @user = User.find_by_email(m_email)

    return @user
  end

  def is_user
    return (self.user_id != nil)
  end

end
