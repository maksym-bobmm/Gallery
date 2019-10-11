# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base
  prepend_after_action :navigation, only: %i[index show]
  before_action :sort_category, only: %i[index show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || categories_path
  end

  def default_url_options
    Rails.logger.fatal 'ApplicationController#default_url_options' if Rails.logger.level == 4
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    Rails.logger.fatal 'ApplicationController#switch_locale' if Rails.logger.level == 4
    locale = current_user&.locale || params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def sort_category
    Rails.logger.fatal 'ApplicationController#sort_category!' if Rails.logger.level == 4
    @categories_with_rating = find_categories_rating  # application_helper
  end

  def configure_permitted_parameters
    added_attrs = %i[first_name last_name birthdate avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def navigation
    Rails.logger.fatal 'ApplicationController#navigation' if Rails.logger.level == 4
    return unless user_signed_in?
    return if request.url&.include? 'admin'

    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 1)
  end

  def find_categories_rating
    Rails.logger.fatal 'ApplicationHelper#find_categories_rating' if Rails.logger.level == 4
    Rails.logger.debug "\033[32mSTART-OOOOOOOOOOOOOOOOOOOOOO application helper\033[0m"
    category_with_rating = []
    Category.friendly.find_each do |category|
      sum = category.images.length
      category.images.each do |image|
        sum += image.likes_count
        sum += image.comments_count
      end
      category_with_rating << { category: category, rating: sum }
    end
    Rails.logger.debug "\033[32mEND-OOOOOOOOOOOOOOOOOOOOOOOO application helper\033[0m"
    category_with_rating.sort_by { |hash| hash[:rating] }.reverse
  end
end
