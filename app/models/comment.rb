# frozen_string_literal: true

# comment model
class Comment < ApplicationRecord
  validates_presence_of :body, :image, :user
  belongs_to :image, counter_cache: true
  belongs_to :user
end
