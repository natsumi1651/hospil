class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @requests = current_user.requests.order(created_at: :desc)
  end

end
