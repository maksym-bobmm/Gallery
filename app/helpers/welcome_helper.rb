# frozen_string_literal: true

# helper need to delete
module WelcomeHelper
  def find_popular_images
    images = Image.order(:likes_count).reverse
    index = 0
    result_arr = []
    while result_arr.size < 5 do
      if images[index].path.width > images[index].path.height
        result_arr << images[index]
      end
      index += 1
    end
    result_arr
  end
end
