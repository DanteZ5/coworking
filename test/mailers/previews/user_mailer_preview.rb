# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    request = Request.last
    UserMailer.welcome(request)
  end

  def check
    request = Request.last
    UserMailer.check(request)
  end


end
