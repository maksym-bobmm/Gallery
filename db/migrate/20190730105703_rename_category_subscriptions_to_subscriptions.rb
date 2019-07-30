class RenameCategorySubscriptionsToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    rename_table :category_subscriptions, :subscriptions
  end
end
