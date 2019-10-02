# frozen_string_literal: true

# class for change site locale
class LocalesController < ApplicationController
  def update
    if user_signed_in?
      current_user.locale = params[:locale]
      # byebug
      current_user.save!
    end
    # byebug
    redirect_to request.referer.split('?').first + "?locale=#{params[:locale]}"
    # redirect_back fallback_location: root_path(error: 'cant redirect_back' )
  end
end
