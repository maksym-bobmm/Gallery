class ApplicationController < ActionController::Base
  prepend_after_action :navigation, only: [:index, :show]

  def after_sign_in_path_for(resource)
    '/' #user_path(current_user) #your path
  end

  def navigation
    # raise QWe
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 1) if user_signed_in?
  end
end
