class CategoriesController < ApplicationController
  def index
  end

  # def show
  # end

  def new
    render 'new'
    cat = Category.new()
    cat.name = params[:name]
    cat.owner_id = current_user.id
    if cat.save!
      raise qwe
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:name).permit(:name)
  end
end
