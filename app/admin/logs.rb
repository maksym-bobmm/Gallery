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
    column(:action) { |log| log.action.activity }
    actions
  end
  permit_params :user_id, :action_id, :url
end
