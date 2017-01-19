class GamesController < ApplicationController

  def index
    @games = Game.all
    if params[:search]
      @search = params[:search]
      @games = Game.where('name  ~* ?', "#{@search}").order(name: :desc)
    else
      @games = Game.all.order(name: :desc)
    end
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews
  end


end
