# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Like tests checks that', type: :feature do
  let(:image) { create(:image) }
  context 'unsigned in user' do
    it 'gets sign_in page after try to set like' do
      visit image_path(image)
      click_link 'image-like_link'
      assert_text 'Sign in'
    end
  end
  context 'signed in user' do
    before(:each) { sign_in image.category.user }
    xit 'can set like (need to fix test for ajax)' do
      visit image_path(image)
      click_link 'image-like_link'

      expect(has_no_link?('image-like_link')).to be true
      expect(has_link?('image-unlike_link')).to be true
      expect(Like.where(image_id: image.id, user_id: image.category.user.id).count).to eq(1)
    end
    xit 'can delete like (need to fix test for ajax)' do
      create(:like, user_id: image.category.user.id, image_id: image.id)
      visit image_path(image)
      click_link 'image-unlike_link'

      expect(has_link?('image-like_link')).to be true
      expect(has_no_link?('image-unlike_link')).to be true
      expect(Like.where(image_id: image.id, user_id: image.category.user.id).count).to eq(0)
    end
  end
end
