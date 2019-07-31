module CategoriesHelper
  def find_popular_image(category)
    category.images.order(:rating).last
  end
end
