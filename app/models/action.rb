# frozen_string_literal: true

# model action
class Action < ApplicationRecord
  validates :activity, :presence => true,
            :inclusion => { in: ['navigation', 'likes', 'comments', 'user sign in', 'user sign out', 'qwe'] }
  has_many :logs

  def to_s
    activity
  end
end
