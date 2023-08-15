class RequestsController < ApplicationController
  def index
  end


  def new
    @request = Request.new
  end

  def create
    Request.create(request_params)
    redirect_to '/'
  end

  private
  def request_params
    params.require(:request).permit(:title, :date, :dexcription, :expected_length, :expected_place)
  end

end
