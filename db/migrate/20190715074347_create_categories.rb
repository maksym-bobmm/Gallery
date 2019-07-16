class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.bigint :owner_id, null: false
      t.string :name, null: false
    end
    add_foreign_key :categories, :users, column: :owner_id, primary_key: 'id'
  end
end
