# frozen_string_literal: true

# category controller class
class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy edit update]


  def index
    @categories_with_rating = find_categories_rating
  end

  def show
    @category = Category.find(params[:id])
    @subscription_exist = current_user.subscriptions.find_by(category_id: @category.id).present? if user_signed_in?
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
    category = current_user.categories.where(id: params[:id])
    return unless category.first.present?

    redirect_to categories_path if category.first.destroy
  end

  def edit
  end

  def update
    return unless current_user.categories.find(params[:id]).update(name: params[:name])

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_categories_rating
    category_with_rating = []
    Category.find_each do |category|
      sum = category.images.length
      category.images.each do |image|
        sum += image.likes_count
        sum += image.comments_count
      end
      category_with_rating << { category: category, rating: sum }
    end
    category_with_rating.sort_by { |hash| hash[:rating] }.reverse
  end
end
