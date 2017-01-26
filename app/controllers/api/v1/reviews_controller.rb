class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @user = current_user
    render json: @user
  end

  def new
    @game = Game.find(params[:id])
    @review = Review.new
  end

  def destroy
    data = JSON.parse(request.body.read)
    review = Review.find(data["id"])
    @commentUsers = []
    @game = Game.find(params[:game_id])
    ReviewMailer.delete_review(@review, @game).deliver_now
    if review.delete
      @reviews = @game.reviews.order(:created_at).reverse
      @reviews.each do |review|
        user = User.find(review.user_id)
        @commentUsers << user
      end
      render json: {reviews: @reviews, users: @commentUsers }
    end
  end

  def update
    #data is the fetch request
    data = JSON.parse(request.body.read)
    props = {}
    review = Review.find(data["id"])
    @game = review.game
    @commentUsers = []
    if (data["type"] == "update")
      props["comment"] = data["comment"]
      props["rating"] = data["rating"]
      props["id"] = data["id"]
      review.rating = data["rating"]
      review.comment = data["comment"]
      review.save
      @reviews = @game.reviews.order(:created_at).reverse
      @reviews.each do |review|
        user = User.find(review.user_id)
        @commentUsers << user
      end
    end
    if (data["type"] == "upvote")
      review.up_votes += 1
      review.save
      @reviews = @game.reviews.order(:created_at).reverse
      @reviews.each do |review|
        user = User.find(review.user_id)
        @commentUsers << user
      end
    end
    if (data["type"] == "downvote")
      review.down_votes += 1
      review.save
      @reviews = @game.reviews.order(:created_at).reverse
      @reviews.each do |review|
        user = User.find(review.user_id)
        @commentUsers << user
      end
    end
    render json: {reviews: @reviews, users: @commentUsers }
  end

  def create
    @game = Game.find(params[:game_id])
    #this is how you read fetch body data
    data = JSON.parse(request.body.read)
    @user = User.find(data["userId"])
    @review = Review.new(comment: data["comment"], rating: data["rating"])
    @review.user = @user
    @review.game = @game
    @commentUsers = []

    if @review.save!
      @reviews = @game.reviews.order(:created_at).reverse
      @reviews.each do |review|
        user = User.find(review.user_id)
        @commentUsers << user
      end
      render json: {reviews: @reviews, users: @commentUsers }
    else
      render json: {message: "Did not work"}, status: 404
    end
  end
end
