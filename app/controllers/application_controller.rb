# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base
  prepend_after_action :navigation, only: %i[index show]
  before_action :sort_category, only: %i[index show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || categories_path
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    locale = current_user&.locale || params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def sort_category
    @categories_with_rating = helpers.find_categories_rating  # application_helper
  end

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :birthdate]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

  private

  def navigation
    return unless user_signed_in?
    return if request.referrer&.include? 'admin'

    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 1)
  end
end
