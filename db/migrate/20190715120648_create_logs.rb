class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :ulr, null: false

      t.datetime :created_at, null: false
    end
  end
end
