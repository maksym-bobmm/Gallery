# frozen_string_literal: true

# subscription model
class Subscription < ApplicationRecord
  validates_presence_of :user, :category
  belongs_to :user
  belongs_to :category

  # def to_s
  #   self.name
  # end
end
