# frozen_string_literal: true

# categories helper
module CategoriesHelper
  def find_popular_image(category)
    category.images.order(:likes_count).last
  end

  def subscribed?
    return false unless user_signed_in?
    # byebug
    # current_user.subscriptions.where(category_id: params[:id]).exists?
    Category.friendly.find(params['id']).subscriptions.where(user_id: current_user.id).exists?
  end
end
