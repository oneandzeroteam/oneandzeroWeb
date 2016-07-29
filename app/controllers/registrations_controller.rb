class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :is_admin,
                                 :student_number,
                                 :name,
                                 :department_name,
                                 :entry_semester,
                                 :kakaotalkid,
                                 :profile_image_url,
                                 :confirmation_token,
                                 :confirmed_at,
                                 :confirmation_sent_at)
  end

  def account_update_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :is_admin,
                                 :student_number,
                                 :name,
                                 :department_name,
                                 :entry_semester,
                                 :kakaotalkid,
                                 :profile_image_url,
                                 :confirmation_token,
                                 :confirmed_at,
                                 :confirmation_sent_at)
  end
end
