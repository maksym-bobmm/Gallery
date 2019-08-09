class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'owner_id'
  has_many :images, dependent: :destroy
  has_many :subscriptions, dependent: :delete_all
  # has_many :users, through: :subscriptions
end
