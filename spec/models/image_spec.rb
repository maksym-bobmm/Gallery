# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  context 'validate test' do
    subject { create(:image) }
    it 'ensures that valid with valid parameters' do
      expect(subject.valid?).to be true
    end
    it 'ensures that path is set' do
      subject.path = nil
      expect(subject.valid?).to be false
    end
  end

  context 'associations test' do
    let(:id) { 500 }
    it 'ensures that category exist' do
      image = create(:image)
      expect(image.category).to be_persisted
    end
    it 'ensures that category contain image after create one' do
      create(:image_with_category_id, id: id, category_id: id)
      expect(Category.find(id).images.find(id)).to be_present
    end
    it 'ensures that likes does not exist after drop image' do
      create(:like_with_image_id, image_id: id)
      Image.find(id).destroy
      expect(Like.where(image_id: id).count).to eq(0)
    end
    it 'ensures that comments does not exist after drop image' do
      create(:comment_with_image_id, image_id: id)
      Image.find(id).destroy
      expect(Comment.where(image_id: id).count).to eq(0)
    end
  end
end
