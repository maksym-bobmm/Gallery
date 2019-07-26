class ImagesController < ApplicationController
  before_action :set_category

  def show
    @comments = Array.new
    @image = Image.find(params[:id])
    @comments << Comment.find_by(image_id: @image.id)
  end

  def new
    @image = Image.new
  end

  def create
    @category.images.create(image_params)
    # raise Go
    redirect_to @category
  end

  private

  def image_params
    params.permit(:path, :name, :filename, :picture)
  end

  def set_category
    @category = Category.find(params[:cat_id]) if params[:cat_id]
  end
end
