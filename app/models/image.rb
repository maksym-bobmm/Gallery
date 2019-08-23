# frozen_string_literal: true

class Image < ApplicationRecord
  mount_uploader :path, ImageUploader
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :delete_all
  # has_many :users, through: :likes
  def to_s
    self.path
  end
end
