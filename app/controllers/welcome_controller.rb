# frozen_string_literal: true

# need to delete
class WelcomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    Rails.logger.fatal 'WelcomeController#index'
    @top_popular_images = find_popular_images
    @categories_count = Category.all.size
    @images_count = Image.all.size
    @likes_count = Like.all.size
    @comments_count = Comment.all.size
  end

  private

  # FIXME: CHECK WHY ONLY 4 IMAGES IN ARRAY. EXPECT 5
  def find_popular_images
    Rails.logger.fatal 'WelcomeController#find_popular_images'
    Rails.logger.info "\033[32mSTART WelcomeController#find_popular_images\033[0m"
    images = Image.order(likes_count: :desc).limit(5)
    return if images.empty?

    index = 0
    result_arr = []
    while index < images.size
      result_arr << images[index] if images[index].path.width > images[index].path.height
      index += 1
    end
    Rails.logger.info "\033[32mEND WelcomeController#find_popular_images\033[0m"
    result_arr
  end
end
