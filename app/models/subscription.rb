# frozen_string_literal: true

# subscription model
class Subscription < ApplicationRecord
  validates_presence_of :user, :category
  validates_uniqueness_of :user_id, scope: :category_id, message: 'is already subscribed to the category'
  belongs_to :user
  belongs_to :category
end
