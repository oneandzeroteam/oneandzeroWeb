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

  def destroy_timeline
    set_timeline
    @timeline.destroy
    respond_to do |format|
      format.html { redirect_to admin_timelines_path, notice: '이벤트가 제거되었습니다' }
      format.json { head :no_content }
    end

  end

  # ================================================ BOARDS CRUD =================================================

  def index_boards
    @boards = Board.all
    render template: "admin/boards"
  end

  def new_board
    @board = Board.new
  end

  def create_board
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to admin_boards_path , notice: '게시판이 성공적으로 생성되었습니다' }
      else
        format.html { redirect_to admin_boards_path, notice: '게시판 생성에 실패했습니다'}
      end
    end
  end

  def destroy_board
    set_board
    @board.destroy
    respond_to do |format|
      format.html { redirect_to admin_boards_path, notice: '게시판이 제거되었습니다' }
      format.json { head :no_content }
    end
  end

  # ============================================== BOARDS CRUD END ===============================================

  # ============================================== POSTS CRUD =================================================

  def index_posts
    board = Board.find(params[:boardid])
    unless board.nil?
      @posts = board.posts
      render template: "admin/posts"
    else
      respond_to do |format|
        format.html { redirect_to admin_boards_path, notice: '해당되는 게시판이 없습니다' }
        format.json { head :no_content }
      end
    end
  end

  def destroy_post
    set_post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to action: "index_posts", boardid: @post.board.id , notice: '게시글이 제거되었습니다' }
      format.json { head :no_content }
    end
  end

  def destroy_comment
    set_comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: '댓글이 제거되었습니다' }
      format.json { head :no_content }
    end
  end

  # ============================================== POSTS CRUD END =============================================

  # ============================================== PROJECTS CRUD =================================================

  def index_projects
    @projects = Project.all
    render template: "admin/projects"
  end

  def new_project
    @project = Project.new
  end

  def create_project
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to admin_projects_path , notice: '프로젝트가 성공적으로 생성되었습니다' }
      else
        format.html { redirect_to admin_projects_path, notice: '프로젝트 생성에 실패했습니다'}
      end
    end
  end

  def destroy_project
    set_project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: '프로젝트가 제거되었습니다' }
      format.json { head :no_content }
    end
  end

  # ============================================== PROJECTS END CRUD =============================================

  # ============================================== BORROWED CRUD =================================================

  def index_items
    @user = current_user
    @borrowablestuffs = Borrowablestuff.all
    render template: "admin/borrowed"
  end

  def new_item
    @item = Borrowablestuff.new
  end

  def create_item
    @item = Borrowablestuff.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to admin_itmes_path , notice: '대여 물품이 성공적으로 생성되었습니다' }
      else
        format.html { redirect_to admin_items_path, notice: '물품 생성에 실패했습니다'}
      end
    end
  end

  def destroy_item
    set_item
    @item.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: '물품이 제거되었습니다' }
      format.json { head :no_content }
    end
  end

  # ============================================ BORROWED CRUD END ===============================================

  private

  def is_admin?
    if user_signed_in?
      if current_user.is_admin
        return true
      else
        render file: "public/401.html", status: :unauthorized, layout: false
      end

    else
      redirect_to new_user_session_path, flash: {notice: "로그인이 필요한 페이지입니다."}
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:memberid])
  end

  def member_params
    params.require(:member).permit(:name, :email)
  end

  def set_timeline
    @timeline = Timeline.find(params[:timelineid])
  end

  def timeline_params
    params.require(:timeline).permit(:title, :content, :date)
  end

  def set_board
    @board = Board.find(params[:boardid])
  end
  
  def board_params
    params.require(:board).permit(:name, :description)
  end

  def set_post
    @post = Post.find(params[:postid])
  end

  def set_comment
    @comment = Comment.find(params[:commentid])
  end

  def set_project
    @project = Project.find(params[:projectid])
  end

  def project_params
    params.require(:project).permit(:title, :short_description, :long_description, :image_url, :is_ongoing)
  end

  def set_item
    @itme = Borrowablestuff.find(params[:itemid])
  end

  def item_params
    params.require(:item).permit(:stufftype,:stuffstrco, :stuffintc, :stuffcode ,:description ,:image_url)
  end
end
