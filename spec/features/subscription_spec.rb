require 'rails_helper'

RSpec.feature "Subscription tests check that", type: :feature do
  context 'signed in user' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    before(:each) { sign_in user }
    scenario 'can subscribe on category' do
      visit category_path(category)
      click_link 'category-subscribe'
      assert_text 'unsubscribe'
    end
    scenario 'can unsubscribe from category' do
      create(:subscription, user_id: user.id, category_id: category.id)
      visit category_path(category)
      click_link 'category-unsubscribe'

      assert_text 'subscribe'
    end

  end
end
