class CategoriesController < ApplicationController
  before_action :authenticate_user!


  def index
  end

  def show
    @category = Category.find(params[:id])
    @subscription_exist = current_user.subscriptions.find_by(category_id: @category.id).present?
  end

  def new
    @category = Category.new
  end

  def create
    if current_user.categories.create(name: category_params[:name])
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  def destroy
    # raise QWE
    category = current_user.categories.where(id: params[:id])
    if category.first.present?
        redirect_to categories_path if category.first.destroy
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