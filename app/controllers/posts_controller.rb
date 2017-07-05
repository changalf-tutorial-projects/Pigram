class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :like, :destroy]
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]
  
  def new 
    @post = current_user.posts.build
  end
  
  def index
    @posts = Post.following(current_user.following).order('created_at DESC').page(params[:page]).per(3)
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "New image posted!"
      redirect_to posts_path
    else
      flash_unsuccessful_message
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "Image updated!"
      redirect_to post_path
      # redirect_to post_path(@post)
    else
      flash_unsuccessful_message
    end
  end
  
  def like 
    if @post.liked_by current_user
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    end
  end
  
  def destroy
    if @post.destroy
      flash[:success] = "Image deleted!"
      redirect_to root_path
    else 
      flash_unsuccessful_message
      render :edit
    end
  end
  
  private
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:image, :caption)
    end
    
    def owned_post
      unless current_user == @post.user
        flash[:alert] = "This post doesn't belong to you!"
        redirect_to root_path
      end
    end
    
    def flash_unsuccessful_message
      # When rendering view, flash.now can be used; when redirecting to new view,
      # use flash without the now
      flash.now[:alert] = "Something went wrong!"
    end
end
