class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end


  def new
    @request = Request.new
  end

  def create
    @request = Request.create(request_params)
    redirect_to '/'
  end

  def show
    # @request = Request.find(params[:id])
    
  end

  private
  def request_params
    params.require(:request).permit(:title, :date, :description, :expected_length, :expected_place)
  end

end
