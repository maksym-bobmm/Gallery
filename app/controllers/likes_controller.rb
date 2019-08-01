class LikesController < ApplicationController
  before_action :find_image

  def create
    if already_liked?
      @image.likes.where(user_id: current_user.id).delete_all
      decrement_images_rating
      Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 2)
    else
      @image.likes.create(user_id: current_user.id)
      increment_images_rating
      Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 2)
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

  def increment_images_rating
    @image.rating += 1
    @image.save
  end

  def decrement_images_rating
    @image.rating -= 1
    @image.save
  end
end
