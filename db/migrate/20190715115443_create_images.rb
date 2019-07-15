class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :path, null: false

      t.datetime :created_at, null: false
    end
  end
end
