class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :ulr, null: false

      t.datetime :created_at, null: false
    end
  end
end
