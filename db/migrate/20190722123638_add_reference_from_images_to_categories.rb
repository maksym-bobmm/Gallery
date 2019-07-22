class AddReferenceFromImagesToCategories < ActiveRecord::Migration[5.2]
  def change
    change_table :images do |t|
      t.references :categories, null: false, foreign_key: true
    end
  end
end
