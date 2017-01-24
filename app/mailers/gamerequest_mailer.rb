class GamerequestMailer < ApplicationMailer
  default from: 'lagalaxygamers@gmail.com'
  
  def delete_gamerequest(gamerequest)
    @gamerequest = gamerequest

    mail(
      to: gamerequest.user.email,
      subject: "Request Denied for #{gamerequest.name}"
    )
  end
end
