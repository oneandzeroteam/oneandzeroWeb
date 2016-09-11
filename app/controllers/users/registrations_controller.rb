class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    if !verify_recaptcha and !Rails.env.development?
      flash.delete :recaptcha_error
      build_resource(sign_up_params)
      resource.valid?
      # resource.errors.add(:base, "There was an error with the recaptcha code below. Please re-enter the code.")
      resource.errors.add(:base, "Recaptcha 과정에서 문제가 발생했습니다. 다시 시도해주세요.")
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render :new }
    else
      flash.delete :recaptcha_error
      super
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin, :student_number, :name, :department_name, :entry_semester, :kakaotalkid, :profile_image_url, :confirmation_token, :confirmed_at, :confirmation_sent_at)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin, :student_number, :name, :department_name, :entry_semester, :kakaotalkid, :profile_image_url, :confirmation_token, :confirmed_at, :confirmation_sent_at)
  end
end
