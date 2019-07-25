class ImagesController < ApplicationController
  before_action :set_category

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @category.images.create(image_params)
    # raise Go
    redirect_to categories_path
  end

  private

  def image_params
    params.permit(:path, :name, :filename, :picture)
  end

  def set_category
    @category = Category.find(params[:cat_id])
  end
end
