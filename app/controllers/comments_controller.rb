class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current.user_id
    if @comment.save
      flash[:sucess] = "Comment posted."
      redirect_to :back
    else 
      flash[:alert] = "Something went wrong!"
      render root_path
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
    
    def set_post
      @post = Post.find(params[:post_id])
    end
end