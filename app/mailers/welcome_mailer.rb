class WelcomeMailer < ActionMailer::Base
  default from: "aliina.tudose@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome, #{user.name}")
  end

end
