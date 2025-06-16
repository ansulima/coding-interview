class UserMailer < ApplicationMailer
  default from: 'nao-responda@socialfeed.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bem-vindo(a) a Nobe Solutions!')
  end
end
