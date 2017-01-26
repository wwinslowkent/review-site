class Api::V1::GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def index
    @games = Game.all
    @user = current_user
    render json: { user: @user }
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews.order(:created_at).reverse
    @user = current_user
    @commentUsers = []
    @isAdmin = admin_signed_in?
    @reviews.each do |review|
      user = User.find(review.user_id)
      @commentUsers << user
    end
    render json: { user: @user, reviews: @reviews, commentUsers: @commentUsers, isAdmin: @isAdmin }
    # passing in user and review through ajax call in react
    # http://localhost:3000/api/v1/games/3.json to see the object
  end
end
