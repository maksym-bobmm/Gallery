# frozen_string_literal: true

# categories helper
module CategoriesHelper
  def find_popular_image(category)
    category.images.order(:likes_count).last
  end

  def subscribed?
    return false unless user_signed_in?

    current_user.subscriptions.where(category_id: params[:id]).exists?
  end
end
