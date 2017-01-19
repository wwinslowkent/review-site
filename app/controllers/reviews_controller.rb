class ReviewsController < ApplicationController

  def new
    @game = Game.find(params[:id])
    @review = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.game = @game

    if @review.save
      flash[:notice] = "Review saved successfully."
      redirect_to game_path(@game)
    else
      flash[:alert] = "Failed to save review."
      redirect_to game_path(@game)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :user)
  end
end
