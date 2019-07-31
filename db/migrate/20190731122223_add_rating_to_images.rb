class AddRatingToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :rating, :integer, default: 0
  end
end
