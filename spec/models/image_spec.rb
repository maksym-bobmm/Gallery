# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'old' do
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
        expect(Like.where(image_id: id).count).to be_zero
      end
      it 'ensures that comments does not exist after drop image' do
        create(:comment_with_image_id, image_id: id)
        Image.find(id).destroy
        expect(Comment.where(image_id: id).count).to be_zero
      end
    end
  end
  describe  do
    context 'columns' do
      %i[id path created_at category_id likes_count comments_count slug].each do |field|
        it { is_expected.to have_db_column field }
      end
    end
    context 'associations' do
      it { is_expected.to have_many(:comments).dependent(:destroy) }
      it { is_expected.to have_many(:likes).dependent(:delete_all) }
      it { is_expected.to belong_to :category }
    end
    context 'validation' do
      it { is_expected.to validate_presence_of :path }
      %i[likes_count comments_count].each do |field|
        it { is_expected.to validate_numericality_of(field).is_greater_than_or_equal_to(0) }
        it { is_expected.to allow_value(1).for(field) }
        it { is_expected.to allow_value(0).for(field) }
        it { is_expected.to_not allow_value(-1).for(field) }
      end
    end
  end
end
