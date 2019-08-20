ActiveAdmin.register Category do

  index do
    selectable_column
    column 'category_id', :id
    column 'user_id', :owner_id
    column :name
    column 'owner' do |category|
      category.user.email
    end
    actions
  end
  preserve_default_filters!
  # byebug
  filter :owner_id, as: :select, label: 'user', collection: (User.pluck(:email))

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
  # filter :category, as: :category_name
  remove_filter :subscriptions
  # filter :users, as User.all.email
end
