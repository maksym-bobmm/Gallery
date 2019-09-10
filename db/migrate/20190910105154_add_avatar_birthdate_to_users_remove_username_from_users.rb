class AddAvatarBirthdateToUsersRemoveUsernameFromUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthdate, :date
    add_column :users, :avatar, :string
    remove_column :users, :username, :string
  end
end
