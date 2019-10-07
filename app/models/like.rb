# frozen_string_literal: true

# like model
class Like < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :image_id, message: 'is already sets like to this image'
  belongs_to :user
  belongs_to :image, counter_cache: true
end
