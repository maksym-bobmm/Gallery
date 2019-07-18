class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email
    @user = params[:user]
    @ulr = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
