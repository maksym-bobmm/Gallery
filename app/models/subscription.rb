# frozen_string_literal: true

# subscription model
class Subscription < ApplicationRecord
  validates_presence_of :user, :category
  validates_uniqueness_of :user_id, scope: :category_id, message: 'this combination of user and category already exists'
  # validates :user_id, uniqueness: { scope: :category_id }
  # validates :user_id, uniqueness: { scope: [:category_id, :user_id] }
  belongs_to :user
  belongs_to :category

  # def to_s
  #   self.name
  # end
end
