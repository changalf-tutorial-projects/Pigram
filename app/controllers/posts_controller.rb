class PostsController < ApplicationController
  def new 
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "New image posted!"
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  private
    def post_params
      params.require(:post).permit(:image, :caption)
    end
end
