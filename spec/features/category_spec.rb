# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  let(:user) { create(:user) }
  let(:category_name) { Faker::Lorem.word }
  before(:each) { sign_in user }
  context 'can be' do
    scenario 'created by signed in user' do
      visit 'categories/'
      click_link 'category-create_collapse'
      fill_in 'category-name_field', with: category_name
      click_button 'category-create_button'

      expect(page).to have_text category_name
    end
  end
  context 'can be delete' do
    let!(:category) { create(:category_with_owner_id, name: category_name, owner_id: user.id) }
    scenario 'deleted by signed in user' do
      visit 'categories/'
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept

      expect(page).to_not have_content category.name
    end
  end
end
