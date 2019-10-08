# frozen_string_literal: true

# likes helper
module LikesHelper
  def already_liked?
    byebug
    return false unless user_signed_in?
    warn '[DEPRECATION] already_liked? is deprecated. Please use image#show variable instead.'
    # Like.where(user_id: current_user.id, image_id: params[:id]).exists?
    Image.friendly.find(params['id']).likes.where(user_id: current_user.id).exists?
  end
end
