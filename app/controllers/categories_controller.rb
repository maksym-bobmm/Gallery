# frozen_string_literal: true

# category controller class
class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy edit update]
  before_action :sort_category, only: %i[index show]

  def index; end

  def show
    @category = Category.friendly.find(params[:id])
    @subscription_exist = user_signed_in? ? @category.subscriptions.find_by(user_id: current_user.id).present? : false
  end

  def create
    if current_user.categories.create!(category_params)
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
    params.permit( :name)
  end
end
