class SubscriptionsController < ApplicationController
  before_action :find_category, only: %i[create destroy]
  after_action  :send_email,    only: %i[create destroy]

  def create
    @category.subscriptions.create(user_id: current_user.id)
    redirect_to category_path(@category)
  end

   def destroy
     @category.subscriptions.find_by(user_id: current_user.id).destroy
     redirect_to category_path(@category)
   end

  private

  def send_email
    action = request.parameters[:action] == 'create' ? true : false
    UserMailer.with(category: @category, user: current_user, subscribe: action).subscriptions.deliver_later
  end

  def find_category
    @category = Category.find Rails.application.routes.recognize_path(request.referrer)[:id]
  end
end
