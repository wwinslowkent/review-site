class ReviewsController < ApplicationController

  # POST /resource
  def create
    @game = Game.find(params[:game_id])
    @review = Review.new(params_strong)
    @review.game = @game
    if @review.save
      flash[:notice] = "Thank you for submitting your review"
    else
      flash[:notice] @review.errors.full_messages.to_sentence
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
