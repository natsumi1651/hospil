class LikesController < ApplicationController
  before_action :set_request

  def create
    like = current_user.likes.build(request_id: params[:request_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  
  def destroy
    like = Like.find_by(request_id: params[:request_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_request
    @request = Request.find(params[:request_id])
  end

end
