class LocalesController < ApplicationController
  def update
    if user_signed_in?
      current_user.locale = params[:locale]
      current_user.save!
    end
    # raise qwe
    redirect_to request.referer.split('?').first + "?locale=#{params[:locale]}"
  end
end
