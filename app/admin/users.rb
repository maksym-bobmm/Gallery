# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :id,  :email, :created_at, :updated_at, :confirmed_at, :confirmation_sent_at, :provider
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column :created_at
    column :updated_at
    column :email
    column :confirmed_at
    column :confirmation_sent_at
    column :provider
    actions
  end
  filter :categories
  filter :email
  filter :created_at
  filter :updated_at
  # byebug
  filter :provider
end
