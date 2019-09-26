# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation test' do
    subject { create(:category) }
    it 'valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'ensures that owner_id exist' do
      subject.owner_id = nil
      expect(subject).to_not be_valid
    end
    it 'ensures that name exist' do
      subject.name = nil
      expect(subject).not_to be_valid
    end
  end
  context 'associations test' do
    let(:id) { 500 }
    it 'ensures images not exist after delete category' do
      image = create(:image)
      category_id = image.category.id
      image.category.destroy
      expect(Image.where(category_id: category_id).count).to eq(0)
    end
    it 'ensures category exist after creating' do
      create(:category, id: id)
      expect(Category.where(id: id).count).to eq(1)
    end
    it 'ensures that category contain image after creating' do
      create(:image_with_category_id, id: id, category_id: id)
      expect { Category.find(id).images.find(id) }.to_not raise_error # ActiveRecord::RecordNotFound
    end
  end
end
