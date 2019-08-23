# frozen_string_literal: true

ActiveAdmin.register Category do

  controller do
    def edit
      render 'admin/category/edit', :layout =>'active_admin'
    end
  end
  # controller do
  #   edit do
  #     form do |f|
  #       f.inputs do
  #       f.input :name
  #     end
  #       f.actions
  #     end
  #   end
  # end

  # config.set_page_presenter :edit do
  #   form :partial => 'edit'
  # end

  index do
    selectable_column
    column 'category_id', :id
    column 'user_id', :owner_id
    column :name
    column('owner') { |category| category.user.email }
    actions
  end


  preserve_default_filters!
  # byebug
  filter :owner_id, as: :select, label: 'user2'#, collection: (User.joins(:categories).pluck(:email).where(owner_id: :owner_id))

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
