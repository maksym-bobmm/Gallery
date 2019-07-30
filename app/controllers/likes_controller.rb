class LikesController < ApplicationController
  before_action :find_image

  def create
    if already_liked?
      @image.likes.where(user_id: current_user.id).delete_all
    else
      @image.likes.create(user_id: current_user.id)
    end
    redirect_to image_path(@image)
  end

  def destroy
    @image.likes.where(user_id: current_user.id).delete_all
  end

  private

  def find_image
    @image = Image.find(params[:image][:img_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, image_id: params[:image][:img_id]).exists?
  end
end
