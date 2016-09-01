class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      respond_with_navigational(resource) { render :new }
    end
  end

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
