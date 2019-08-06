# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  prepend_after_action :after_login, only: [:create]
  prepend_before_action :before_logout, only: [:destroy]

  def after_login
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 4)
  end

  def before_logout
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 5)
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end