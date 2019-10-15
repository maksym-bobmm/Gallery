# frozen_string_literal: true

ActiveAdmin.register Category do
  controller do
    def edit
      render 'admin/category/edit', layout: 'active_admin'
    end
  end

  index do
    selectable_column
    column 'category_id', :id
    column 'user_id', :owner_id
    column :name
    column('owner') { |category| category.user.email }
    actions
  end

  preserve_default_filters!
  # filter :owner_id, as: :select, label: 'user2' # ,
                                      # collection: (User.joins(:categories).pluck(:email).where(owner_id: :owner_id))

  remove_filter :subscriptions
  # filter :users, as User.all.email
end
