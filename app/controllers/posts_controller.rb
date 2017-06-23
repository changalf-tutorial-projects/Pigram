class PostsController < ApplicationController
  def new 
    @post = Post.new
  end
  
  def index
  end
  
  def create
    redirect_to :root
  end
end
