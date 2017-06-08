class CommentsController < ApplicationController
	def create
    
    @commentable = Company.find(params[:company_id])
    @comment =@commentable.comments.create(comment_params)
    @comment.save
    redirect_to company_path(@commentable)
  end
   
  def upvote
   @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    respond_to do |format|
      format.js { render :file=>  'comments/comments.js.erb'}
      end
  end
  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    respond_to do |format|
     format.html { redirect_to :back }
     format.js {render :file=> 'comments/comments.js.erb'}
    end
  end
  def destroy
    @commentable = Company.find(params[:company_id])
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to company_path(@commentable)
  end
 

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

