class RequestsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      UserMailer.welcome(@request).deliver_now
      redirect_to "/"
    else
      render :new
    end
  end

  def index
    @requests = Request.all
  end

  def update
    @request = Request.find(params[:id])
    @request.accept!
    redirect_to requests_path
  end

end

private

  def request_params
    #white list
    params.require(:request).permit(:name, :email, :phone_number, :bio, :status)
  end
