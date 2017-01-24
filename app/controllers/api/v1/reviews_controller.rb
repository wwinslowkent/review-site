class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def index
    @user = current_user
    render json: @user
  end

  def new
    @game = Game.find(params[:id])
    @review = Review.new
  end

  def create

    @game = Game.find(params[:game_id])
    #this is how you read fetch body data
    data = JSON.parse(request.body.read)

    @user = User.find(data["userId"])
    @review = Review.new(comment: data["comment"], rating: data["rating"])
    @review.user = @user
    @review.game = @game


    if @review.save!
      @reviews = Review.all
      render json: @reviews
    else
      render json: {message: "Did not work"}, status: 404
    end
  end
end
