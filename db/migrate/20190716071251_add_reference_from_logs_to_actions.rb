class AddReferenceFromLogsToActions < ActiveRecord::Migration[5.2]
  def change
    add_reference :logs, :actions, foreign_key: true
  end
end
