# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Image tests checks that", type: :feature do
  subject { create(:user) }
  let!(:category) { create(:category, name: 'test') }
  context 'unsigned in user' do
    scenario 'redirects to sign_in page after creating image try' do
      visit 'categories/test'
      click_link 'image-button_collapse'
      attach_file('image-file_pick', Rails.root.join('app', 'assets', 'images', 'categories', 'cars', '239145_main.jpg'))

      assert_text 'Sign in'
    end
  end
  context 'signed in user' do
    before(:each) { sign_in subject }
    scenario 'can create an image' do
      visit 'categories/test'
      click_link 'image-button_collapse'
      attach_file('image-file_pick', Rails.root.join('app', 'assets', 'images', 'categories', 'cars', '239145_main.jpg'))

      expect { click_button 'image-add_button' }.to change(Image, :count).by 1
    end

  end
end
