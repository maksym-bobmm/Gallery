class Image < ApplicationRecord
  mount_uploader :path, ImageUploader
  belongs_to :categories, optional: true
  has_many :comments
end
