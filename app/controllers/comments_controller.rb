class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to "/requests/#{comment.request.id}"
    # @request= Request.find(params[:id])
    # @comment=Comment.new(comment_params)
    #   if @comment.save  
    #     redirect_to "/requests/#{comment.request.id}"
    #   end
      
  end

  # def create
  #   Comment.create(comment_params)
  #   redirect_to :index
  #   # redirect_to "/tweets/#{comment.tweet.id}" 
  # end


  private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :request_id).merge(user_id: current_user.id, request_id: params[:request_id])
  end
end
