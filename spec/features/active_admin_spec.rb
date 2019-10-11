require 'rails_helper'

RSpec.feature "ActiveAdmins", type: :feature do
  context 'test checks that' do
    let(:admin) { create(:admin) }
    before(:each) { sign_in admin }
    it 'dashboard page can be accessed' do
      visit admin_dashboard_path
      within '#title_bar' do
        assert_text 'Dashboard'
      end
    end
    it 'Admin Users page can be accessed' do
      visit admin_admin_users_path
      within '#title_bar' do
        assert_text 'Admin Users'
      end
    end
    it 'Categories page can be accessed' do
      visit admin_categories_path
      within '#title_bar' do
        assert_text 'Categories'
      end
    end
    it 'Comments page can be accessed' do
      visit admin_comments_path
      within '#title_bar' do
        assert_text 'Comments'
      end
    end
    it 'Image Links page can be accessed' do
      visit admin_image_links_path
      within '#title_bar' do
        assert_text 'Image Links'
      end
    end
    it 'Images page can be accessed' do
      visit admin_images_path
      within '#title_bar' do
        assert_text 'Images'
      end
    end
    it 'Logs page can be accessed' do
      visit admin_logs_path
      within '#title_bar' do
        assert_text 'Logs'
      end
    end
    it 'Users page can be accessed' do
      visit admin_users_path
      within '#title_bar' do
        assert_text 'Users'
      end
    end
  end
end
