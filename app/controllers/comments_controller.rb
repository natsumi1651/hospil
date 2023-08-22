class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    return unless @comment.save

    redirect_to "/requests/#{@comment.request.id}"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    #  redirect_to "/requests/#{@comment.request.id}"
    redirect_to request_path(comment.request)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :request_id).merge(user_id: current_user.id, request_id: params[:request_id])
  end
end
