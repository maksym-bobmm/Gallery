class AddIdToLikesAndSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :id, :primary_key
    add_column :subscriptions, :id, :primary_key
  end
end
