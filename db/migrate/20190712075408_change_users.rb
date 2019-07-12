class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :first_name
      t.integer :integ
      t.bigint :biginteg
      t.numeric :numer
      t.decimal :decim
    end
  end
end
