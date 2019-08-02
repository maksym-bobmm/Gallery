class Image < ApplicationRecord
  mount_uploader :path, ImageUploader
  belongs_to :categories
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :delete_all
  has_many :users, through: :likes
end
