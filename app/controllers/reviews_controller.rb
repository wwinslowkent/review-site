class ReviewsController < ApplicationController

  def new
    @game = Game.find(params[:id])
    @review = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = Review.new(params_strong)
    @review.game = @game
    @reviews = @game.reviews
    @review.user = current_user

    if @review.save
      flash[:notice] = "Thank you for submitting your review"
      redirect_to game_path(@game)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render '/games/show'
    end
  end

  private

  def params_strong
    params.require(:review).permit(
      :rating,
      :comment
      )
  end

end
