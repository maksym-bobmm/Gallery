class CategorySubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :category_subscriptions, id: false do |t|
      t.references :user, foreign_key: true
      t.references :categories, foreign_key: true
    end
  end
end
