# frozen_string_literal: true

ActiveAdmin.register Image do
  remove_filter :comments
  remove_filter :likes

  index do
    selectable_column
    id_column
    column :image do |image|
      link_to(image_tag(image.image.thumb.url, alt: "qqq", title: "qqqq"), admin_image_path(image)) unless image[:image].nil?
    end
    column :created_at
    column :category
    actions
  end

  form title: 'Create ImageParser' do |f|
    f.inputs 'ImageLoaders' do
      input :category
      input :path, input_html: {value: "#{params[:remote_path_url]}"} #, :as => :hidden
      input :remote_path_url, input_html: {value: "#{params[:remote_path_url]}"} #, :as => :hidden
    end
    actions
  end

  controller do
    def permitted_params
      params.permit image: [:id, :path, :category_id, :remote_image_url ]
    end

    def create
      img = Image.new
      if params[:image][:remote_path_url].present?
        img.remote_path_url =  params[:image][:remote_path_url]
      else
        img.path = params[:image][:path]
      end
      img.category = Category.find(params[:image][:category_id]) if params[:image][:category_id].present?
      img.save
      redirect_to admin_image_path(img)
    end
  end
end
