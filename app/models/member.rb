class Member < ApplicationRecord
  searchkick
  self.per_page = 9

	has_one :user

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
