require 'rails_helper'

RSpec.feature 'Menu test', type: :feature do
  context 'check links' do
    let(:user) { create(:user) }
    before(:each) { sign_in user }
    scenario 'category' do
      visit '/'
      click_link 'menu-categories'
      assert_text 'category list'
    end
    scenario 'category' do
      category = create(:category)
      visit '/'
      click_link 'menu-category_list_main'
      click_link 'menu-category_list_0'
      assert_text category.name
    end
    scenario 'images' do
      visit '/'
      click_link 'menu-images'
      assert_text 'Images'
    end
    scenario 'category after change locale' do
      visit '/categories'
      click_link 'menu-locale_main'
      click_link 'menu-locale_1'
      assert_text 'список категорий'
    end
  end
end
