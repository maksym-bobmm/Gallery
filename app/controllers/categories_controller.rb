class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def create
    img = Image.new
    File.open(params[:picture].tempfile.path) do |file|
      img.path = file
    end
    img.save!
  end
end
