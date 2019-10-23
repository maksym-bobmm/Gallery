# frozen_string_literal: true

# like controller class
class LikesController < ApplicationController
  before_action :authenticate_user!,  only: %i[create destroy]
  before_action :find_image,          only: %i[create destroy]
  after_action  :logging,             only: %i[create destroy]
  # after_action :set_likes_count_to_redis, only: %i[create destroy]

  def create
    return if @image.likes.find_by(user_id: current_user.id)

    set_likes_count_to_redis if @image.likes.create(user_id: current_user.id)
    redirect_to image_path(@image) and return unless request.xhr?

    render json: { link_with_image_tags: helpers.link_for_unlike(@image), likes_count: @image.likes_count,
                   likes_word: @image.likes_count == 1 ? t(:'site.image.like') : t(:'site.image.likes') }
  end

  def destroy
    like =  @image.likes.find_by(user_id: current_user.id)
    return unless like

    set_likes_count_to_redis if like.destroy
    redirect_to image_path(@image) and return unless request.xhr?

    render json: { link_with_image_tags: helpers.link_for_like, likes_count: @image.likes_count,
                   likes_word: @image.likes_count == 1 ? t(:'site.image.like') : t(:'site.image.likes') }
  end

  private

  def logging
    Log.create(user_id: current_user.id, url: url_for, created_at: Time.now, action_id: 2)
  end

  def find_image
    id = category_params[:img_id] || Rails.application.routes.recognize_path(request.referrer)[:id]
    @image = Image.friendly.find(id)
    # @image = Image.find(Rails.application.routes.recognize_path(request.referrer)[:id])
  end

  def category_params
    params.permit(:img_id)
  end

  def set_likes_count_to_redis
    Redis.new.set("image:#{@image.id}:likes_count", @image.likes_count, ex: 180)
  end
end
