class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: true
      # t.string :password, null: false
      t.string :first_name, null: true
      t.string :last_name, null: true
      # t.string :email, null: false
      t.timestamps
    end
  end
end
