class CategorySubscriptionsController < ApplicationController
  before_action :find_category

  def create
    # raise QWE
    if subscribed?
      @category.category_subscriptions.where(user_id: current_user.id).delete_all
    else
      @category.category_subscriptions.create(user_id: current_user.id)
    end
    redirect_to category_path(@category)
  end

  private

  def subscribed?
    current_user.category_subscriptions.where(categories_id: params[:category][:category_id]).exists?
  end

  def find_category
    @category = Category.find params[:category][:category_id]
  end
end
