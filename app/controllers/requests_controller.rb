class RequestsController < ApplicationController
 before_action :move_to_index, except: [:index, :show, :search]
 before_action :no_authority, only: :edit

  def index
    @requests = Request.all
  end


  def new
    @request = Request.new
  end

  def create
 
    @request = current_user.requests.new(request_params)
    # @request = Request.create(request_params)
    if @request.save
       redirect_to "/users/#{current_user.id}"
    else
    render :new, status: :unprocessable_entity
    end
  end



  def show
    @request = Request.find(params[:id])
    @comment = Comment.new
    @comments = @request.comments.includes(:user)
    
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
    redirect_to "/users/#{current_user.id}"
  end

  def search
    @requests = current_user.requests.search(params[:keyword])
  end


  private
  def request_params
    params.require(:request).permit(:title, :date, :description, :expected_length, :expected_place, :category_id)
  end
 
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def no_authority
    @request = Request.find(params[:id])
    if @request.user != current_user
      redirect_to root_path
     end
  end

end
