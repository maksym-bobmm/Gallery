# frozen_string_literal: true

#log model
class Log < ApplicationRecord
  belongs_to :user
  belongs_to :action

  ransacker :filter_log,
            formatter: ->(v) {
              ids = Log.where(action_id: Action.find_by(activity: v).id).pluck(:id)
              ids.present? ? ids : nil
    } do |parent|
    parent.table[:id]
  end
  ransacker :filter_user,
            formatter: ->(v) {
              ids = Log.all.where(user_id: User.find_by(email: v).id).pluck(:id)
              ids.present? ? ids : nil
            } do |parent|
    parent.table[:id]
  end
end
