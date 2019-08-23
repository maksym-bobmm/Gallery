# frozen_string_literal: true

ActiveAdmin.register Image do

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
  # index as: :grid do |image|
  #   image_tag(image.path)
  # end
  #
  # content :title => proc{ I18n.t("active_admin.images") } do
  #   columns do
  #     column do
  #       panel "Recent Images" do
  #         ul do
  #           Image.find_each do |image|
  #             li link_to(image, admin_image_path(image))
  #           end
  #         end
  #       end
  #     end
  #   end
  # end
  remove_filter :comments
  remove_filter :likes
end
