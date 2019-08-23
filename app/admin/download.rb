# frozen_string_literal: true

ActiveAdmin.register_page 'download' do
  menu priority: 2, label: proc { I18n.t('active_admin.download') }

  content title: proc { I18n.t('active_admin.download') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end
  end
  content do
    render partial: 'download'
  end

  # create do
  #
  # end

end
