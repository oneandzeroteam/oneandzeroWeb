class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if !verify_recaptcha
      flash.delete :recaptcha_error
      # build_resource(sign_up_params)
      self.resource = resource_class.new(sign_in_params)
      sign_out
      resource.valid?
      flash.now[:alert] = "Recaptcha 과정에서 문제가 발생했습니다. 다시 시도해주세요."
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render :new }
    else
      flash.delete :recaptcha_error
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
