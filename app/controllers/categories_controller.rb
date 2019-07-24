class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.name = category_params[:name]
    @category.owner_id = current_user.id
    if @category.save!
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  # def create
  #   @category = Category.new
  #   @category.name = category_params[:name]
  #   @category.owner_id = current_user.id
  #   if @category.save!
  #     redirect_to categories_path
  #   else
  #     redirect_to new_category_path
  #   end
  # end

  def destroy
    # raise qwe
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
