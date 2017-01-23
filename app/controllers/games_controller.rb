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


end
