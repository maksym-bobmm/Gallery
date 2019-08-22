class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :find_image,  only: %i[create destroy]
  after_action  :logging,     only: %i[create destroy]

  def create
    # byebug
    @image.likes.create(user_id: current_user.id)
    increment_images_rating
    redirect_to image_path(@image)

  end

  def destroy
    # byebug
    @image.likes.find_by(user_id: current_user.id).destroy
    decrement_images_rating
    # redirect_to image_path(@image)

  end

  private

  def logging
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 2)
  end

  def find_image
    @image = Image.find(Rails.application.routes.recognize_path(request.referrer)[:id])
  end

  def increment_images_rating
    @image.rating += 1
    @image.save!
  end

  def decrement_images_rating
    @image.rating -= 1 if @image.rating.positive?
    @image.save!
  end
end
