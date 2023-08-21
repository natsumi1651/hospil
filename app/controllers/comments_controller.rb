class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save  
     redirect_to "/requests/#{@comment.request.id}"
   
     end
      
  end

  # new_comment = Comment.create(comment_params)
  # redirect_to "/requests/#{comment.request.id}"



  private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :request_id).merge(user_id: current_user.id, request_id: params[:request_id])
  end
end
