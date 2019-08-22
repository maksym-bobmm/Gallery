class Action < ApplicationRecord
  has_many :logs

  def to_s
    self.activity
  end
end
