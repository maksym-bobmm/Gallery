# frozen_string_literal: true

# mailer fo email registration, subscriptions
class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def new_image_in_category
    users = User.joins(:subscriptions).where(subscriptions: { category_id: params[:category_id] }).pluck(:email)
    mail(to: users, subject: 'New Image on you subscriptions')
  end

  def subscriptions
    @name = params[:category].fetch('name')
    user = params[:user]
    @is_subscribe = params[:subscribe]
    if @is_subscribe
      mail(to: user.fetch('email'), subject: 'Successful subscription')
    else
      mail(to: user.fetch('email'), subject: 'Successful unsubscription')
    end
  end
end
