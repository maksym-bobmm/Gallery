class RenameLogsColumnsUlrToUrlAndActionsIdToActionId < ActiveRecord::Migration[5.2]
  def change
    rename_column :logs, :ulr, :url
    rename_column :logs, :actions_id, :action_id
  end
end
