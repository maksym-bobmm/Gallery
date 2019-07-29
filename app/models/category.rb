class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  has_many :category_subscriptions, dependent: :destroy
  has_and_belongs_to_many :users, through: :category_subscriptions
end
