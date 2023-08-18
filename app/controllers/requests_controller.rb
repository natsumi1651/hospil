class RequestsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @requests = Request.includes(:user)
  end


  def new
    @request = Request.new
  end

  def create
    @request = Request.create(request_params)
    redirect_to '/'
  end

  def show
    @request = Request.find(params[:id])
    
  end

  def destroy
    request = Request.find(params[:id])
    request.destroy
    redirect_to root_path
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    request = Request.find(params[:id])
    request.update(request_params)
    redirect_to root_path
  end

  private
  def request_params
    params.require(:request).permit(:title, :date, :description, :expected_length, :expected_place).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
