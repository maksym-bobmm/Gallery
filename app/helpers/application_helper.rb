# frozen_string_literal: true

# application helper
module ApplicationHelper
  def find_categories_rating
    category_with_rating = []
    Category.find_each do |category|
      sum = category.images.length
      category.images.each do |image|
        sum += image.likes_count
        sum += image.comments_count
      end
      category_with_rating << { category: category, rating: sum }
    end
    category_with_rating.sort_by { |hash| hash[:rating] }.reverse
  end

  def find_locale
    params[:locale] || I18n.default_locale
  end
end
