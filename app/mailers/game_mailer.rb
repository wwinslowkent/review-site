class GameMailer < ApplicationMailer
  default from: 'lagalaxygamereviews@gmail.com'

  def new_game(gamerequest)
    @gamerequest = gamerequest

    mail(
      to: gamerequest.user.email,
      subject: "Request Approved for #{gamerequest.name}"
    )
  end
end
