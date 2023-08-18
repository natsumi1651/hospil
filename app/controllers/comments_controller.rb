class CommentsController < ApplicationController
  def create
    @request= Request.find(params[:id])
    @comment=Comment.new(comment_params)
    
      if @comment.save
        
        redirect_to "/requests/#{comment.request.id}"

      else
        
        render :index
      end
   


  private
  def comment_params
    params.require(:comment).permit(:text, , :user_id, :prototype_id).merge(user_id: current_user.id, request_id: params[:request_id])
  end
end
