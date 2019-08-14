class ApplicationController < ActionController::Base
  prepend_after_action :navigation, only: [:index, :show]

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || categories_path
  end

  private

  def navigation
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 1) if user_signed_in?
  end
end
