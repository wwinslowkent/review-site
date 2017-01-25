class UserMailer < ApplicationMailer
  default from: 'lagalaxygamereviews@gmail.com'

  def delete_user(user)
    @user = user

    mail(
      to: @user.email,
      subject: "Deleted Account for #{user.name}"
    )
  end
end
