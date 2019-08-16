ActiveAdmin.register Log do

  index do
    selectable_column
    column 'log_id', :id
    column :user_id do |log|
      User.find(log.user_id).email
    end
    column :created_at
    column :action_id do |log|
      log.action.activity
    end
    column { |log| log.action.activity }
    actions

  end

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
  
end
