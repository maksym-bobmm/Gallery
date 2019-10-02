require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'helllo' do
    let(:email) { 'gallery@mailinator.com' }
    let(:password) { 'qwerty' }
    let!(:user) { create(:user, email: email, password: password, password_confirmation: password) }
    scenario 'sign in on site' do
      visit 'users/sign_in'
      fill_in 'sign_in-email', with: email
      fill_in 'sign_in-pass', with: password
      byebug
      click_button 'sign_in-button'
      expect(page).to have_content('SIGN OUT')
    end
  end

end
