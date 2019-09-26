# frozen_string_literal: true

# image model
class Image < ApplicationRecord
  validates_presence_of :path
  mount_uploader :path, ImageUploader
  paginates_per 10
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :delete_all
  def to_s
    path
  end
end
