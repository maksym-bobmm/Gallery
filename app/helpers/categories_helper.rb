module CategoriesHelper
  def find_popular_image(category)
    category.images.order(:rating).last
  end

  def find_categories
    cats = {}
    category = Category.all
    category.each do |cat|
      final_sum = 0
      cat.images.each do |image|
        final_sum += image.rating + image.comments.count + 1 # +1 its images count
      end
      cats[cat.name.to_sym] = final_sum
    end
    cats.sort_by{|_,v| v}.reverse
  end
end