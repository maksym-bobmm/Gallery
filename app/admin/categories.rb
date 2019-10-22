# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :name, :owner_id
  index do
    selectable_column
    column 'category_id', :id
    column 'user_id', :owner_id
    column :name
    column('owner') { |category| category.user.email }
    actions
  end

  preserve_default_filters!
  remove_filter :subscriptions
end
