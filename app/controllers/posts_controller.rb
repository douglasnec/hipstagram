class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :update]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :content, :image, :tag_names))
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    # @post = current_user.posts.find(params[:id])
  end

  def index
    @posts = Post.display_by_tags_or_all(params[:tag_id])
    # .order('created_at DESC')
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    
    if @post.update(params[:post].permit(:title, :content, :image, :tag_names))
      redirect_to '/posts'
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])

    @post.destroy

    redirect_to '/posts'
  end

  def search
    @posts = Post.where('title ILIKE?', "%#{params[:query]}%")
    render 'index'
  end
end
