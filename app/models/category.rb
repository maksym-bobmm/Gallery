class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  has_many :category_subscriptions, dependent: :delete_all
  has_many :users, through: :category_subscriptions
end
