# frozen_string_literal: true

# like controller class
class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :find_image,  only: %i[create destroy]
  after_action  :logging,     only: %i[create destroy]

  def create
    # byebug
    @image.likes.create(user_id: current_user.id)
    redirect_to image_path(@image)
  end

  def destroy
    # byebug
    @image.likes.find_by(user_id: current_user.id).destroy
    redirect_to image_path(@image)
  end

  private

  def logging
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 2)
  end

  def find_image
    id = category_params[:img_id] || Rails.application.routes.recognize_path(request.referrer)[:id]
    @image = Image.find(id)
    # @image = Image.find(Rails.application.routes.recognize_path(request.referrer)[:id])
  end

  def category_params
    params.permit(:img_id)
  end
end
