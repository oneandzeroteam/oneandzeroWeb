class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @boards = Board.all
    @board = Board.where(name: params[:boardname]).first
    @posts = @board.posts.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @board = Board.where(name: params[:boardname]).first
  end

  # GET /posts/new
  def new
    if user_signed_in?
      @board = Board.where(name: params[:boardname]).first
      @post = Post.new
    else
      redirect_to new_user_session_path
    end
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    board = Board.where(name: params[:boardname]).first
    @post.board_id = board.id
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to "/board/#{board.name}", notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to :show, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
