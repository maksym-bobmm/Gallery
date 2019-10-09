# frozen_string_literal: true

# need to delete
class WelcomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    @top_popular_images = find_popular_images
    @categories_count = Category.all.size
    @images_count = Image.all.size
    @likes_count = Like.all.size
    @comments_count = Comment.all.size
  end

  private

  # TODO check why only 4 images in array. Expect 5
  def find_popular_images
    images = Image.order(likes_count: :desc).limit(5)
    return if images.empty?

    index = 0
    result_arr = []
    while index < images.size
      result_arr << images[index] if images[index].path.width > images[index].path.height
      index += 1
    end
    Rails.logger.info 'AAAAAAAAAA!! Its searching popular images withing ALL ones'
    # byebug
    result_arr
  end
end
