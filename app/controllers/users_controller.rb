class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @requests = current_user.requests.order(created_at: :desc)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :sir_name, :first_name, :phone_number, :address)

  end

   
end
