module LikesHelper
  def already_liked?
    Like.where(user_id: current_user.id, image_id: params[:id]).exists?
  end
end
