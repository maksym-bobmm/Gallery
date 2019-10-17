# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :created_at, :updated_at, :confirmed_at, :first_name, :last_name, :birthdate, :avatar,
                :password, :password_confirmation
  # controller do
  #   def permitted_params
  #     params.permit!
  #   end
  # end
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
  form title: 'Create user' do |f|
    inputs 'Details' do
      input :first_name
      input :last_name
      input :email
      input :password
      input :password_confirmation
      input :confirmed_at, as: :datepicker,
            datepicker_options: {
                min_date: "1900-01-01",
                max_date: 'now',
                change_year: true
            }
      input :birthdate, as: :datepicker,
            datepicker_options: {
                min_date: "1900-01-01",
                max_date: "+5Y",
                change_year: true
            }

      input :avatar

      actions
    end
  end
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
  filter :provider
end
