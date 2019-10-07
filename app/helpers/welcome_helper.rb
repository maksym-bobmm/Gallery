# frozen_string_literal: true

# helper need to delete
module WelcomeHelper
  def find_popular_images
    images = Image.order(likes_count: :desc).limit(5)
    return if images.empty?

    index = 0
    result_arr = []
    while index < images.size
      # byebug if index == 26
      result_arr << images[index] if images[index].path.width > images[index].path.height
      index += 1
    end
    result_arr
  end

  def count_categories
    Category.all.size
  end

  def count_images
    Image.all.size
  end

  def count_likes
    Like.all.size
  end

  def count_comments
    Comment.all.size
  end
end
