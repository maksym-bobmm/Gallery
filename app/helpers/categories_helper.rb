# frozen_string_literal: true

module CategoriesHelper
  def find_popular_image(category)
    category.images.order(:likes_count).last
    byebug
  end

  def subscribed?
    return false unless user_signed_in?
    current_user.subscriptions.where(category_id: params[:id]).exists?
  end
end