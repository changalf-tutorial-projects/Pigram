class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:sucess] = "Comment posted."
      redirect_to :back
    else 
      flash[:alert] = "Something went wrong!"
      render root_path
    end
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment deleted."
      redirect_to root_path
    else
      flash[:alert] = "Comment not deleted!"
      render post_comment_path
    end
  end
  
  private
    def comment_params
      # In this app, the column name that stores the comment value is called 'Context', not 'Content'!
      params.require(:comment).permit(:context)
    end
    
    def set_post
      @post = Post.find(params[:post_id])
    end
end