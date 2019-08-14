ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Recent Images" do
          ul do
            Image.last(5).map do |image|
              li link_to(image, admin_image_path(image))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end


    index do
      column :name

      column 'Downloader' do |p|
        image_tag p.thumb.url
      end

      # column 'Members' do |p|
      #   p.is_member?
      # end

      default_actions
    end

    # section "Download images" do
    #   div do
    #     render "index"
    #   end
    # end

    # render Rails.root.join('app', 'views', 'admin_users', 'nokogiri', 'index').to_s
  end # content
end
