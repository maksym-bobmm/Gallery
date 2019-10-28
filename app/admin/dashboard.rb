# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
    end

    columns do
      column do
        panel 'Recent Images' do
          ul class: 'dashboard-images' do
            Image.last(10).each do |image|
              ul link_to(image_tag(image.path.thumb.to_s, alt: image.path), admin_image_path(image))
            end
          end
        end
      end

      columns do
        column do
          panel 'Recent Comments' do
            ul class: 'dashboard-comments' do
              Comment.last(5).each do |comment|
                ul link_to(comment.body, image_path(comment.image_id))
              end
            end
          end
        end

        column do
          panel 'Recent Categories' do
            ul class: 'dashboard-categories' do
              Category.last(5).each do |category|
                ul link_to(category.name, category_path(category))
              end
            end
          end
        end
      end
    end
    columns do
      column do
        panel 'Users Action' do
          table_for Log.select('logs.id, logs.url, users.email, actions.activity').joins(:user, :action).find_each do
            column 'log_id', :id
            column :url
            column :email
            column 'action', :activity
          end
        end
      end
    end
  end
end
