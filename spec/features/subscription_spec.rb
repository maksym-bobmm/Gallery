require 'rails_helper'

RSpec.feature "Subscription tests checks that", type: :feature do
  let(:category) { create(:category) }
  context 'unsigned in user' do
    scenario 'gets sign_in page after subscribe try' do
      visit category_path(category)
      Rails.logger.fatal 'before click' # if Rails.logger.level == 4
      click_link 'category-subscribe'

      assert_text 'Sign in'
    end
  end
  context 'signed in user' do
    before(:each) { sign_in category.user }
    scenario 'can subscribe on category' do
      visit category_path(category)
      click_link 'category-subscribe'
      assert_text 'unsubscribe'
    end
    scenario 'can unsubscribe from category' do
      create(:subscription, user_id: category.user.id, category_id: category.id)
      visit category_path(category)
      click_link 'category-unsubscribe'

      assert_text 'subscribe'
    end

  end
end
