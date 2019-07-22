class CategoriesController < ApplicationController
  def index

  end

  def show

  end
  def create

    file = Image.new(params[:filename])
    raise QWE
  end
end
