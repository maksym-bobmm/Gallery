# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'ActiveAdmins', type: :feature do
  context 'test checks that menu`s' do
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
  context 'test checks that category' do
    let!(:category) { create(:category) }
    let(:admin) { create(:admin) }
    let(:category_name) { Faker::Lorem.characters(number: 10) }
    before(:each) { sign_in admin }
    it 'can be created' do
      user = create(:user)
      visit admin_categories_path
      click_link 'New Category'
      select user.email, from: 'category_owner_id'
      fill_in 'category_name', with: category_name
      click_link_or_button 'Create Category'

      assert_text 'Category was successfully created.'
    end
    it 'can be deleted from a list' do
      category = create(:category, name: category_name)
      visit admin_categories_path
      within(:table_row, [category.name]) do
        click_link class: 'delete_link'
        page.driver.browser.switch_to.alert.accept
      end
      within '#main_content' do
        assert_no_text category_name
      end
    end
    it 'can be edited from a list' do
      new_category_name = Faker::Lorem.characters(number: 10)
      category = create(:category, name: category_name)
      visit admin_categories_path
      within(:table_row, [category.name]) do
        click_link class: 'edit_link'
      end
      select category.user.email, from: 'category_owner_id'
      fill_in 'category_name', with: new_category_name
      click_link_or_button 'Update Category'
      visit admin_categories_path

      within '#main_content' do
        assert_text new_category_name
        assert_no_text category_name
      end
    end
    it 'filter can filter by user' do
      visit admin_categories_path
      select category.user.email, from: 'q_owner_id'
      click_link 'Filter'

      within '#main_content' do
        assert_text category.user.email
      end
    end
  end
  context 'test checks that admin users' do
    let(:admin) { create(:admin) }
    before(:each) { sign_in admin }
    it 'can be created' do
      visit admin_admin_users_path
      click_link 'New Admin User'
      fill_in 'admin_user_email', with: Faker::Internet.email
      fill_in 'admin_user_password', with: 'password'
      fill_in 'admin_user_password_confirmation', with: 'password'
      click_link_or_button 'Create Admin user'

      assert_text 'Admin user was successfully created.'
    end
    it 'can be filtered by email' do
      admin2 = create(:admin)
      visit admin_admin_users_path
      within '.panel_contents' do
        find('option', text: 'Equals').click
        fill_in 'q_email', with: admin2.email
        click_link_or_button 'Filter'
      end
      within '#main_content' do
        assert_text admin2.email
      end
    end
    it 'can be deleted from list' do
      email = create(:admin).email
      visit admin_admin_users_path
      within(:table_row, [email]) do
        click_link class: 'delete_link'
        page.driver.browser.switch_to.alert.accept
      end

      within '#main_content' do
        assert_no_text email
      end
    end
  end
end
