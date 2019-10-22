# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  # let(:user) { create(:user) }
  context 'can' do
    let(:email) { 'gallery@mailinator.com' }
    let(:password) { 'qwerty' }
    let!(:user) { create(:user, email: email, password: password, password_confirmation: password) }
    scenario 'sign in on site with correct email and password' do
      visit 'users/sign_in'
      fill_in 'sign_in-email', with: email
      fill_in 'sign_in-pass', with: password
      click_button 'sign_in-button'
      expect(page).to have_content('SIGN OUT')
    end
    scenario 'sign out from the site' do
      sign_in user
      visit '/'
      click_link_or_button 'menu-sign_out'
      expect(page).to have_content('Sign in')
    end
  end
end
