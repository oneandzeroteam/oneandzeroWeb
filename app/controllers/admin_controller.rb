class AdminController < ApplicationController
  layout "admin"

  def dashboard
    if user_signed_in?
      if is_admin?
        render template: "admin/dashboard"
      else
        render file: "public/401.html", status: :unauthorized, layout: false
      end

    else
      redirect_to new_user_session_path
    end
  end


  def indexusers
    @users = User.all
    render template: "admin/users"
  end

  def deleteuser
    @user = User.find(params[:userid])
    unless @user.is_admin?
      @user.destroy!
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: '사용자가 제거되었습니다.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: '#{@user.email} 은 제거할 수 없습니다.' }
      end
    end
  end


  private

  def is_admin?
    current_user.is_admin == true
  end

end
