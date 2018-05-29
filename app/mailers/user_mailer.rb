class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(request)
    @request = request

    mail(to: @request.email, subject: 'Bienvenue sur la liste Coworking')
  end
end
