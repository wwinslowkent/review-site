class GamesController < ApplicationController

  def index
    @games = Game.all.order(name: :asc)
    if params[:search]
      @search = params[:search]
      @games = Game.where('name  ~* ?', "#{@search}").order(name: :asc)
    else
      @games = Game.all.order(name: :asc)
    end
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews
    @review = Review.new
  end

  def new
    if user_signed_in?
      @game = Game.new
    else
      flash[:alert] = "Please sign in to add a game"
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in? || admin_signed_in?
      @game = Game.create(game_params)

      if @game.save && user_signed_in?
        flash[:notice] = "Thank you for adding this game to our database!"
        redirect_to game_path(@game)
      elsif @game.save && admin_signed_in?
        @gamerequest = Gamerequest.where(name: @game.name).first.destroy
        GameMailer.new_game(@gamerequest).deliver_now
        flash[:notice] = "Thank you for adding this game to our database!"
        redirect_to game_path(@game)
      else
        flash[:notice] = @game.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = "Please sign in to add a game"
      redirect_to new_user_session_path
    end
  end

  def edit
    if admin_signed_in?
      @game = Game.find(params[:id])
    else
      flash[:alert] = "UNAUTHORIZED"
      redirect_to new_admin_session_path
    end
  end

  def update
    if admin_signed_in?
      @game = Game.find(params[:id])
      @game.update_attributes(game_params)

      if @game.save
        flash[:notice] = "Thank you for editing this game!"
        redirect_to game_path(@game)
      else
        flash[:notice] = @game.errors.full_messages.to_sentence
        render :edit
      end
    else
      flash[:alert] = "UNAUTHORIZED"
      redirect_to new_admin_session_path
    end
  end

  def destroy
    if admin_signed_in?
      @game = Game.find(params[:id])
      @game.reviews.all.delete_all
      @game.destroy
      flash[:alert] = "You have deleted this game successfully"
      redirect_to games_path
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to new_admin_session_path
    end
  end

  private

  def game_params
    params.require(:game).permit(
      :name,
      :summary,
      :cover_url
    )
  end
end
