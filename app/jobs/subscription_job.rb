# frozen_string_literal: true

# class for background mail delivery with resque
class SubscriptionJob
  @queue = :subscription

  def self.perform(category, user, action)
    UserMailer.with(category: category, user: user, subscribe: action).subscriptions.deliver
  end
end
