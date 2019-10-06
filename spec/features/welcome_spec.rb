require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  context 'page statistics' do
    it 'categories counter change after add one' do
      visit '/'
      expect do
        create(:category)
        visit '/'
      end.to change { find('#statistics-categories').text }
    end
    it 'images counter change after add one' do
      visit '/'
      expect do
        create(:image)
        visit '/'
      end.to change { find('#statistics-images').text }
    end
    it 'likes counter change after add one' do
      visit '/'
      expect do
        create(:like)
        visit '/'
      end.to change { find('#statistics-likes').text }
    end
    it 'comments counter change after add one' do
      visit '/'
      expect do
        create(:comment)
        visit '/'
      end.to change { find('#statistics-comments').text }
    end
  end
end
