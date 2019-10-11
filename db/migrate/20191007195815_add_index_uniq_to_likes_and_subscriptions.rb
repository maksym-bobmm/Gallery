class AddIndexUniqToLikesAndSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, [:user_id, :image_id], unique: true
    add_index :subscriptions, [:user_id, :category_id], unique: true
  end
end
