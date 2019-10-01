# frozen_string_literal: true

# category model
class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user, foreign_key: 'owner_id'
  has_many :images, dependent: :destroy
  has_many :subscriptions, dependent: :delete_all
  # has_many :users, through: :subscriptions
  # def to_s
  #   self.category.name
  # end
  # runsacker :by_categorization, proc{ |v|
  #   data = Category
  # }
end
