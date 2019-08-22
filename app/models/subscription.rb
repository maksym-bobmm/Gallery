class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # def to_s
  #   self.name
  # end
end
