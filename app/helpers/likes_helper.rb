module LikesHelper
  def already_liked?
    return false unless user_signed_in?
    Like.where(user_id: current_user.id, image_id: params[:id]).exists?
  end
end
