class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :type, null: false

      t.timestamps :created_at, null: false
    end
  end
end
