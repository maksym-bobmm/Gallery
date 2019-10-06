# frozen_string_literal: true

# category controller class
class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy edit update]
  before_action :sort_category, only: %i[index show]

  def index; end

  def show
    @category = Category.friendly.find(params[:id])
    @subscription_exist = current_user.subscriptions.find_by(category_id: @category.id).present? if user_signed_in?
  end

  # def new
  #   @category = Category.new(name: 'test')
  # end

  def create
    if current_user.categories.create(name: category_params[:name])
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  def destroy
    begin
      current_user.categories.friendly.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
      redirect_to categories_path(error: 'no instance')
    rescue
      redirect_to categories_path(error: 'undefined error')
    end
    redirect_to categories_path
  end

  def edit; end

  def update
    return unless current_user.categories.friendly.find(params[:id]).update(name: params[:name])

    redirect_to categories_path
  end

  private

  def category_params
    params.permit(:name)
  end
end
