# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'vaqlidations test' do
    subject { create(:like) }
    it 'ensures that like is valid with valid params' do
      expect(subject.valid?).to be true
    end
    it 'ensures that like is not valid without user_id' do
      subject.user_id = nil
      expect(subject.valid?).to be false
    end
    it 'ensures that like is not valid without image_id' do
      subject.image_id = nil
      expect(subject.valid?).to be false
    end
  end

  context 'associations test' do
    subject { create(:like) }
    let(:id) { 500 }
    it 'ensures that like contain user' do
      expect(subject.user).to be_persisted
    end
    it 'ensures that like contain image' do
      expect(subject.image).to be_persisted
    end
    it 'ensures that user contain like after create one' do
      create(:like_with_user_id, id: id, user_id: id)
      expect(User.find(id).likes.find(id)).to be_present
    end
    it 'ensures that image contain like after create one' do
      create(:like_with_image_id, id: id, image_id: id)
      expect(Image.find(id).likes.find(id)).to be_present
    end
  end
end