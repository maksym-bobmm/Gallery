class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  has_many :subscriptions, dependent: :delete_all
  has_many :users, through: :subscriptions
end
