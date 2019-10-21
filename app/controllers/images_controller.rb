# frozen_string_literal: true

# image controller class
require 'redis'
class ImagesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :find_category,      only: %i[create]

  def show
    redis = Redis.new
    @image = Image.friendly.find(params[:id])

    @likes_count = redis.get("image:#{@image.id}:likes_count") || @image.likes.size
    @path_to_img = ActionController::Base.helpers.path_to_image('liked.svg')
    @like_exist =
        if user_signed_in?
          @image.likes.where(user_id: current_user.id).exists?
        else
          false
        end

  end

  def index
    @images = Image.all.order(likes_count: :desc).page(params[:page]).per(12)
  end

  def create
    @category.images.create(image_params) unless image_params.empty?
    Resque.enqueue(EmailJob, @category.id)
    # UserMailer.with(category: @category).new_image_in_category.deliver_later
    redirect_to @category
  end

  private

  def image_params
    params.permit(:path, :name, :filename, :picture)
  end

  def find_category
    @category = Category.friendly.find(params[:cat_id]) if params[:cat_id]
  end
end
