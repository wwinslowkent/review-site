class API::V1::GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @games = Game.all
    render json: @games
  end

  def show
    @game = Game.find(params["id"])
    @reviews = @game.reviews
    render json: @reviews
  end
end
