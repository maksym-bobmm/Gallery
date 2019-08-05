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

  def fill_categories
    category_with_rating = []
    Category.all.each do |category|
      # todo implement with active record
      query = "select sum(total) from(
                   select sum(images.rating) as total from categories
                          left join images
                          on categories.id = images.category_id
                   where categories.id = #{category.id}

                   union all

                   select count(images)  from categories
                           left join images
                           on categories.id = images.category_id
                   where categories.id = #{category.id}

                   union all

                   select count(comments) from comments
                           left join images
                               on comments.image_id = images.id
                           left join categories
                               on images.category_id = categories.id
                   where categories.id = #{category.id}
                ) as query"
      rating = ActiveRecord::Base.connection.exec_query(query)
      category_with_rating << {category: category, rating: rating.first['sum'].to_i}
    end
    # raise QWE
    category_with_rating.sort_by { |hash| hash[:rating] }.reverse
  end
end