class Api::V1::GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def index
    @games = Game.all
    @user = current_user
    render json: @user
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews
    render json: @reviews
  end
end
