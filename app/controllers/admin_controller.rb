class AdminController < ApplicationController
  before_action :is_admin?
  layout "admin"


  def dashboard
    if is_admin?
      render template: "admin/dashboard"
    end
  end

  # ================================================= USERS CRUD =================================================

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

  # =============================================== USERS CRUD END ===============================================

  # ================================================ MEMBERS CRUD ================================================
  def index_members
    @members = Member.all
    render template: "admin/members"
  end

  def new_member
    @member = Member.new
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

  # ============================================== MEMBERS CRUD END ==============================================

  # =============================================== TIMELINES CRUD ================================================

  def index_timelines
    @timelines = Timeline.all
    render template: "admin/timelines"
  end


  def index_borrowed
    render template: "admin/borrowed"
  end
  
  
  def new_timeline
    @timeline = Timeline.new
  end

  def create_timeline
    @timeline=Timeline.new(timeline_params)

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to admin_timelines_path , notice: '이벤트가 성공적으로 생성되었습니다' }
      else
        format.html { redirect_to admin_timelines_path, notice: '이벤트 생성에 실패했습니다'}
      end
    end
  end

  # ================================================ BOARDS CRUD =================================================
  def index_board
    @boards = Board.all
  end

  # ============================================== BOARDS CRUD END ===============================================

  private

  def is_admin?
    if user_signed_in?
      if current_user.is_admin
        return true
      else
        render file: "public/401.html", status: :unauthorized, layout: false
      end

    else
      redirect_to new_user_session_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:memberid])
  end

  def member_params
    params.require(:member).permit(:name, :email)
  end

  def timeline_params
    params.require(:timeline).permit(:title, :content, :date)
  end
end
