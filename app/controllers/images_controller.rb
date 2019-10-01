# frozen_string_literal: true

# image controller class
class ImagesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_category

  def show
    # @comments = Array.new
    @image = Image.friendly.find(params[:id])
    @comments = Comment.find_by(image_id: @image.id)
    @likes_count = @image.likes.count
    @path_to_img = ActionController::Base.helpers.path_to_image('liked.svg')
  end

  def new
    @image = Image.new
  end

  def index
    @images = Image.all.order(:likes_count).reverse_order.page(params[:page]).per(12)
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

  def set_category
    @category = Category.friendly.find(params[:cat_id]) if params[:cat_id]
  end
end
