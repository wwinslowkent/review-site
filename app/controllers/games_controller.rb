class GamesController < ApplicationController

  def index
    @games = Game.all
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
      redirect_to api_index_path
    end
  end

  def create
    if user_signed_in?
      @game = Game.create(game_params)

      if @game.save
        flash[:notice] = "Thank you for adding this game to our database!"
        redirect_to game_path(@game)
      else
        flash[:notice] = @game.errors.full_messages.to_sentence
        redirect_to :back
      end
    else
      flash[:alert] = "Please sign in to add a game"
      redirect_to :back
    end
  end

  def edit
    if admin_signed_in?
      @game = Game.find(params[:id])
    else
      flash[:alert] = "UNAUTHORIZED"
      redirect_to :back
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
      redirect_to :back
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
      redirect_to :back
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
