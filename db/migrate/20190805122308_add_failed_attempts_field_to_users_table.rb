class AddFailedAttemptsFieldToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :failed_attempts, :integer, default: 0
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
    add_column :users, :cached_failed_attempts, :integer, default: 0

    add_index :users, :unlock_token, unique: true
  end
end
