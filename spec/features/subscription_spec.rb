require 'rails_helper'

RSpec.feature "Subscription tests check that", type: :feature do
  context 'signed in user' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    before(:each) { sign_in user }
    it 'can subscribe on category' do
      visit image_path(category)
      click_link 'category-subscribe'

      assert_text 'unsubscribe'
    end
    it 'can unsubscribe from category' do
      visit image_path(category)
      click_link 'category-unsubscribe'

      assert_text 'subscribe'
    end

  end
end
