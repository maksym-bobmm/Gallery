class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email
    @user = params[:user]
    @ulr = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def new_image_in_category(category)
    users = User.joins(:subscriptions).where subscriptions: {category_id: category.id}
    users.each do |user|
      mail(to:user, subject: 'New Image on you subscriptions')
    end
  end
end
