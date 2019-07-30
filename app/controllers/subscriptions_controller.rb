class SubscriptionsController < ApplicationController
  before_action :find_category

  def create
    # raise QWE
    if subscribed?
      @category.subscriptions.where(user_id: current_user.id).delete_all
    else
      @category.subscriptions.create(user_id: current_user.id)
    end
    redirect_to category_path(@category)
  end

  private

  def subscribed?
    current_user.subscriptions.where(category_id: params[:category][:category_id]).exists?
  end

  def find_category
    @category = Category.find params[:category][:category_id]
  end
end
