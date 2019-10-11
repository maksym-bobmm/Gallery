# frozen_string_literal: true

# application helper
module ApplicationHelper
  def find_categories_rating
    Rails.logger.fatal 'ApplicationHelper#find_categories_rating' if Rails.logger.level == 4
    Rails.logger.debug "\033[32mSTART-OOOOOOOOOOOOOOOOOOOOOO application helper\033[0m"
    category_with_rating = []
    Category.friendly.find_each do |category|
        sum = find_category_rating(category)
        category_with_rating << { category: category, rating: sum }
    end
    Rails.logger.debug "\033[32mEND-OOOOOOOOOOOOOOOOOOOOOOOO application helper\033[0m"
    category_with_rating.sort_by { |hash| hash[:rating] }.reverse
  end
  def find_category_rating(category)
    sum = category.images.length
    category.images.each do |image|
      sum += image.likes_count
      sum += image.comments_count
    end
    sum
  end

  def find_locale
    Rails.logger.fatal 'ApplicationHelper#find_locale' if Rails.logger.level == 4
    current_user&.locale || params[:locale] || I18n.default_locale
  end

  def avatar_to_display
    Rails.logger.fatal 'ApplicationHelper#avatar_to_display' if Rails.logger.level == 4
    current_user.avatar.to_s.present? ? current_user.avatar.to_s : 'avatar'
  end
  def empty_helper_test
    Rails.logger.fatal 'ApplicationHelper#empty_helper_test' if Rails.logger.level == 4
  end
end
