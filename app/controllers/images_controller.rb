# frozen_string_literal: true

# image controller class
require 'redis'
# Image Controller
class ImagesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :find_category,      only: %i[create]

  def show
    redis = Redis.new
    @image = Image.friendly.find(params[:id])

    @likes_count = redis.get("image:#{@image.id}:likes_count") || @image.likes.size
    @path_to_img = ActionController::Base.helpers.path_to_image('liked.svg')
    @like_exist = user_signed_in? ? Image.friendly.find(params['id']).likes.where(user_id: current_user.id).exists? : false
  end

  def index
    @images = Image.all.order(likes_count: :desc).page(params[:page]).per(12)
  end

  def create
    @category.images.create(image_params) unless image_params.empty?
    Resque.enqueue(EmailJob, @category.id)
    redirect_to @category
  end

  private

  def image_params
    params.permit(:path)
  end

  def find_category
    @category = Category.friendly.find(params[:cat_id]) if params[:cat_id]
  end
end
