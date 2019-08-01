class RenameActionsColumnTypeToActivity < ActiveRecord::Migration[5.2]
  def change
    rename_column :actions, :type, :activity
  end
end
