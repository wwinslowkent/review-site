class GamerequestsController < ApplicationController
  def index
    if admin_signed_in?
      @gamerequests = Gamerequest.all
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to new_admin_session_path
    end
    @game = Game.new
  end

  def show
    if admin_signed_in?
      @gamerequest = Gamerequest.find(params[:id])
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to new_admin_session_path
    end
  end

  def new
    if user_signed_in?
      @gamerequest = Gamerequest.new
    else
      flash[:alert] = 'Please sign in to request a game'
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @gamerequest = Gamerequest.create(gamerequest_params)
      @gamerequest.user = current_user
      if @gamerequest.save
        flash[:notice] = 'Request Created Successfully. Please be patient while we process your request.'
        redirect_to games_path
      else
        flash[:notice] = @gamerequest.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = 'Please sign in to request a game'
      redirect_to new_user_session_path
    end
  end

  def edit
    if admin_signed_in?
      @gamerequest = Gamerequest.find(params[:id])
    else
      flash[:alert] = "UNAUTHORIZED"
      redirect_to new_admin_session_path
    end
  end

  def update
    if admin_signed_in?
      @gamerequest = Gamerequest.find(params[:id])
      @gamerequest.update_attributes(gamerequest_params)

      if @gamerequest.save
        flash[:notice] = "Thank you for editing this request!"
        redirect_to gamerequests_path
      else
        flash[:notice] = @gamerequest.errors.full_messages.to_sentence
        render :edit
      end
    else
      flash[:alert] = "UNAUTHORIZED"
      redirect_to new_admin_session_path
    end
  end

  def destroy
    if admin_signed_in?
      @gamerequest = Gamerequest.find(params[:id])
      @gamerequest.destroy
      GamerequestMailer.delete_gamerequest(@gamerequest).deliver_now
      flash[:alert] = "You have deleted this request successfully"
      redirect_to gamerequests_path
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to new_admin_session_path
    end
  end

  private

  def gamerequest_params
    params.require(:gamerequest).permit(
      :name,
      :summary,
      :cover_url,
      :timestamps,
      :user
    )
  end
end
