# frozen_string_literal: true

# class for redirect after email confirm
class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    super do
      sign_in(resource) if resource.errors.empty?
    end
  end

  def after_confirmation_path_for(_,_)
    categories_path
  end
end
