class CreateImageLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :image_links do |t|
      t.string :url, null: false
      t.datetime :created_at, null: false
    end
  end
end
