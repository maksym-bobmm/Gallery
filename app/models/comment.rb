# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :image, counter_cache: true
  belongs_to :user
end
