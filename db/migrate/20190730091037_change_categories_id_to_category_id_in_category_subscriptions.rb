class ChangeCategoriesIdToCategoryIdInCategorySubscriptions < ActiveRecord::Migration[5.2]
  def change
    rename_column :category_subscriptions, :categories_id, :category_id
  end
end
