class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment].permit(:text))
    @comment.post_id = @post.id

    @comment.user = current_user

    if @comment.save
      redirect_to @post
    else
      render 'new'
    end
  end
end
