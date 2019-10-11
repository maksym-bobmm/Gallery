# frozen_string_literal: true

# categories helper
module CategoriesHelper
  def find_popular_image(category)
    category.images.order(likes_count: :desc).first
  end
end
