# frozen_string_literal: true

# comment model
class Comment < ApplicationRecord
  belongs_to :image, counter_cache: true
  belongs_to :user
end
