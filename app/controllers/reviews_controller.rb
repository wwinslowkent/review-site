class ReviewsController < ApplicationController

  # POST /resource
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



  # # GET /resource/edit
  # def edit
  #   super
  # end
  #
  # # PUT /resource
  # def update
  #   super
  # end
  #
  # # DELETE /resource
  # def destroy
  #   super
  # end


  private
    def params_strong
      params.require(:review).permit(
        :rating,
        :comment
        )
    end
end
