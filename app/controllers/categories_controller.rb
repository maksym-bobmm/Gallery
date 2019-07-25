class CategoriesController < ApplicationController
  before_action :authenticate_user!


  def index
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
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

  def create
    if current_user.categories.create(name: category_params[:name])
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  # def destroy
  #   category = Category.find(params[:id])
  #   category.destroy
  #   redirect_to categories_path
  # end

  def destroy
    if current_user.categories.find(params[:id]).destroy
      redirect_to categories_path
    end
  end

  def edit

  end

  def update
    # raise qwe
    if current_user.categories.find(params[:id]).update(name: params[:name])
      redirect_to categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
