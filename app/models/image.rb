# frozen_string_literal: true

# image model
class Image < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :path, ImageUploader
  paginates_per 10
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :delete_all
  def to_s
    path.to_s
  end
  def name
    path.to_s.match(/\/[a-zA-Z0-_.\-]*\z/)
  end
end
