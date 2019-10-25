# frozen_string_literal: true

# categories helper
module CategoriesHelper
  def find_popular_image(category)
    category.images.sort_by(&:likes_count).last
  end
end
