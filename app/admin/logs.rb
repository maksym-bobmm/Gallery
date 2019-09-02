# frozen_string_literal: true

ActiveAdmin.register Log do
  actions :all, except: :edit
  index do
    selectable_column
    column 'log_id', :id
    column :user_id do |log|
      User.find(log.user_id).email
    end
    column :created_at
    # column :action_id do |log|
    #   log.action.activity
    # end
    column(:action) { |log| log.action.activity }
    actions
  end

  # filter :filter_user_in, as: :select, label: 'user', collection: User.all.pluck(:email)
  # filter :filter_log_in, as: :select, label: 'user action', collection: Action.all.pluck(:activity)
end
