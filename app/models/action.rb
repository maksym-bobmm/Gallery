# frozen_string_literal: true

class Action < ApplicationRecord
  has_many :logs

  def to_s
    activity
  end
end
