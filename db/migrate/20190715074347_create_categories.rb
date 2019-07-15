class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.int :owner_id
      t.references :user, foreign_key: true
    end
  end
end
