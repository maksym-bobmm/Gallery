# frozen_string_literal: true

# category controller class
class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy edit update]
  before_action :sort_category, only: %i[index show]

  def index; end

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

  def edit; end

  def update
    return unless current_user.categories.find(params[:id]).update(name: params[:name])

    redirect_to categories_path
  end

  private

  def category_params
    params.permit(:name)
  end
end
