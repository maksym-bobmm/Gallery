class AddCounterLikesAndCommentsToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :likes_count, :integer, default: 0
    add_column :images, :comments_count, :integer, default: 0
  end
end
