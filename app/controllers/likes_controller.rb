class LikesController < ApplicationController
  def create
    like = current_user.likes.build(request_id: params[:request_id])
    like.save
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(request_id: params[:request_id], user_id: current_user.id)
    like.destroy
    redirect_to root_path
  end

end
