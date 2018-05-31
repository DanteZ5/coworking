class RequestsController < ApplicationController
   skip_before_action :authenticate_user!, except: [:index, :update]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      UserMailer.welcome(@request).deliver_now
      flash[:success] = "Merci de consulter votre boîte mail pour une inscription définitive"
      redirect_to "/"
    else
      render :new
    end
  end

  def index
    status = params[:status]
    if status == "unconfirmed"
      @requests = Request.unconfirmed
    elsif status == "confirmed"
      @requests = Request.confirmed
    elsif status == "accepted"
      @requests = Request.accepted
    elsif status == "expired"
      @requests = Request.expired
    else
       @requests = Request.all
    end
    @requests.order(:created_at)
  end

  def update
    @request = Request.find(params[:id])
    @request.accept!
    redirect_to requests_path(status: "confirmed")
  end

  def confirm_email
    request = Request.find_by_confirm_token(params[:id])
    if request
      request.email_confirmed!
      flash[:success] = "Votre email est bien confirmé, vous êtes sur liste d'attente"
      redirect_to "/"
    else
      flash[:error] = "Désolé, utilisateur non connu"
      redirect_to "/"
    end
  end

  def confirm_presence
    request = Request.find_by_confirm_token(params[:id])
    if request
      request.renew!
      flash[:success] = "Vous venez de renouveler votre position en liste d'attente"
      redirect_to "/"
    else
      flash[:error] = "Désolé, utilisateur non connu"
      redirect_to "/"
    end
  end

end

private

  def request_params
    #white list
    params.require(:request).permit(:name, :email, :phone_number, :bio, :status)
  end
