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


  def index_users
    @users = User.all
    render template: "admin/users"
  end

  def destroy_user
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

  def index_members
    @members = Member.all
    render template: "admin/members"
  end

  def new_member
    @member = Member.new
    render template: "admin/new_member"
  end

  def create_member
    @member = Member.create(member_params)

    respond_to do |format|
      if @member.save
        if ((@user = @member.find_pairUser(@member.email)) != nil)
          if @member.add_linkage_with_user(@user)
            format.html { redirect_to admin_members_path,
                                      notice: "Member #{@member.name} was created and linked same User." }
          end
        else
          format.html { redirect_to admin_members_path,
                                    notice: "Member #{@member.name} was created." }
        end
      else
        format.html { redirect_to admin_members_path,
                                  notice: "Creating Member was Failed."}
      end
    end
  end

  def destroy_member
    set_member
    @member.destroy
    respond_to do |format|
      format.html { redirect_to admin_members_path, notice: '멤버가 제거되었습니다' }
      format.json { head :no_content }
    end
  end

  def index_board
    @boards = Board.all
  end



  private

  def is_admin?
    current_user.is_admin
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:memberid])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_params
    params.require(:member).permit(:name, :email)
  end
end
