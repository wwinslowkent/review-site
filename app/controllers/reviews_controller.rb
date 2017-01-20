class ReviewsController < ApplicationController

  def new
    @game = Game.find(params[:id])
    @review = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = Review.new(params_strong)
    @review.game = @game
    @review.user = current_user

    if @review.save
      flash[:notice] = "Thank you for submitting your review"
      redirect_to game_path(@game)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render '/games/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @review = Review.find(params[:id])
    if (current_user == @review.user) || admin_signed_in?
      @review.destroy
      redirect_to game_path(params[:game_id])
    else
      flash[:alert] = "UNAUTHORIZED"
      redirect_to review_path(@review)
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
