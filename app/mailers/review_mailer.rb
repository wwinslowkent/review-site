class ReviewMailer < ApplicationMailer
  default from: 'lagalaxygamereviews@gmail.com'

  def delete_review(review, game)
    @game = game
    @review = review
    @user = User.find(@review.user_id)

    mail(
      to: @user.email,
      subject: "Deleted Review for #{@user.name}"
    )
  end
end
