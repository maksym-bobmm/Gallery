# frozen_string_literal: true

# class for background mail delivery with resque
class EmailJob
  @queue = :email

  def self.perform(category_id)
    UserMailer.with(category_id: category_id).new_image_in_category.deliver
  end
end
