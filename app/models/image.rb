# frozen_string_literal: true

# image model
class Image < ApplicationRecord
  validates_presence_of :path
  validates_numericality_of :likes_count, greater_than_or_equal_to: 0
  validates_numericality_of :comments_count, greater_than_or_equal_to: 0
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
    path.to_s.match %r{ \/[a-zA-Z0-_.\-]*\z }
  end
  # def should_generate_new_friendly_id?
  #   title_changed?
  # end
end
