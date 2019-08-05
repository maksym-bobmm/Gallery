class AddFailedAttemptsFieldToUsersTable < ActiveRecord::Migration[5.2]
  def change
    change_table(:users) do |t|
      t.integer  :failed_attempts, default: 0, null: false
      t.datetime :locked_at
    end
  end
end
