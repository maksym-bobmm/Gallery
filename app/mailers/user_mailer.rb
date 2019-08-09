class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email
    @user = params[:user]
    @ulr = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  # def new_image_in_category
  #   users = User.joins(:subscriptions).where(subscriptions: {category_id: params[:category].id}).pluck(:email)
  #   mail(to:users, subject: 'New Image on you subscriptions')
  # end

  def subscriptions
    @name = params[:category].name
    user = params[:user]
    @is_subscribe = params[:subscribe]
    if @is_subscribe
      mail(to: user.email, subject: 'Successful subscription')
    else
      mail(to: user.email, subject: 'Successful unsubscription')
    end
  end
end
