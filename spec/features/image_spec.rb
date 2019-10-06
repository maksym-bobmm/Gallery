require 'rails_helper'

RSpec.feature "Images", type: :feature do
  subject { create(:user) }
  let!(:category) { create(:category, name: 'test') }
  context 'can be created by signed in user' do
    before(:each) { sign_in subject }
    scenario do
      visit 'categories/test'
      click_link 'image-button_collapse'
      attach_file('image-file_pick', Rails.root.join('app', 'assets', 'images', 'categories', 'cars', '239145_main.jpg'))

      expect { click_button 'image-add_button' }.to change(Image, :count).by 1
    end

  end
end
