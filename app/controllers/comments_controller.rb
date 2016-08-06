class CommentsController < ApplicationController
  # GET /posts/new
  #def new
  #  if user_signed_in?
  #    @post = Comment.new(user: current_user)
  #  end # else 로그인으로 연결필요함
  #end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end