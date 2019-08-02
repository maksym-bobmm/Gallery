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
# пример запроса для рейтина категорий
# select * from(
#     select sum(i.rating) as total from categories as cat
# left join images as i
# on cat.id = i.category_id
# where cat.id = 11
#
# union all
#
# select count(i)  from categories as cat
# left join images as i
# on cat.id = i.category_id
# where cat.id = 11
#
# union all
#
# select count(comments) from comments
# left join images as i
# on comments.image_id = i.id
# left join categories as c
# on i.category_id = c.id
# where c.id = 11) as query