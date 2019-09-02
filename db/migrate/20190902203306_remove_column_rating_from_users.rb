class RemoveColumnRatingFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :rating
  end
end
