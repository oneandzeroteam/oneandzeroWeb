class CommentsController < ApplicationController
  def create
    if user_signed_in?
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      @post = Post.find(params[:post_id])
      @comment.post = @post
    
      respond_to do |format|
        if @comment.save
          @board = @post.board
          format.html { redirect_to "/board/#{@board.name}/posts/#{@post.id}", notice: 'Comment was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end