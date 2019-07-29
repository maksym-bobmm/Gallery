class Image < ApplicationRecord
  mount_uploader :path, ImageUploader
  belongs_to :categories, optional: true
  has_many :comments
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :users, through: :likes
end
