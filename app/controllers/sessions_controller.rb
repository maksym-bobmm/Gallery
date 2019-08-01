class SessionsController < Devise::SessionsController
  prepend_after_action :after_login, only: [:create]
  prepend_before_action :before_logout, only: [:destroy]

  def after_login
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 4)
  end

  def before_logout
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 5)
  end

  def after_sign_in_path_for(resource)
    categories_path
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end
end
