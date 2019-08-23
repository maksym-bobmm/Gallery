# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  prepend_after_action :after_login, only: [:create]
  prepend_before_action :before_logout, only: [:destroy]

  def after_login
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 4) if current_user.present?
  end

  def before_logout
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 5)
  end

  def after_sign_in_path_for(resource)
    resource.update cached_failed_attempts: 0, failed_attempts: 0
    categories_path
  end
  
  def after_sign_out_path_for
    user_session_path
  end

  def create
    flash.clear

    user = User.find_by_email(sign_in_params['email'])
    super && return unless user

    adjust_failed_attempts user

    super && return if user.attributes['failed_attempts'] < User.logins_before_captcha
    super && return if user.access_locked? || verify_recaptcha

    # Don't increase failed attempts if Recaptcha was not passed
    decrement_failed_attempts(user) if recaptcha_present?(params) && !verify_recaptcha

    # Recaptcha was wrong
    self.resource = resource_class.new(sign_in_params)
    sign_out
    flash[:error] = 'Captcha was wrong, please try again.'
    respond_with_navigational(resource) { render :new }
  end

  private def adjust_failed_attempts(user)
    if user.attributes['cached_failed_attempts'].present? &&
       user.attributes['failed_attempts'] > user.attributes['cached_failed_attempts']
      user.update cached_failed_attempts: user.attributes['failed_attempts']
    else
      increment_failed_attempts(user)
    end
  end

  private

  def increment_failed_attempts(user)
    user.increment :cached_failed_attempts
    user.update failed_attempts: user.attributes['cached_failed_attempts']
  end

  def decrement_failed_attempts(user)
    user.decrement :cached_failed_attempts
    user.update failed_attempts: user.attributes['cached_failed_attempts']
  end

  def recaptcha_present?(params)
    params[:recaptcha_challenge_field]
  end
end
