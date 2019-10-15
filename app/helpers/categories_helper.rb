# frozen_string_literal: true

# categories helper
module CategoriesHelper
  def find_popular_image(category)
    # Rails.logger.debug "\033[31mcategory_helper\033[0m"
    # category.images.order(likes_count: :desc).first
    category.images.sort_by(&:likes_count).last
  end
end
