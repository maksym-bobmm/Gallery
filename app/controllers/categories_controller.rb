class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def create
    cat = Category.new
    cat.save!
  end
end
