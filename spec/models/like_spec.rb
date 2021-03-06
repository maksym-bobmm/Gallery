# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'old' do
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
      it 'ensures that user can set only one like' do
        second_like = build(:like, user_id: subject.user.id, image_id: subject.user.id)
        expect { second_like.save! }.to raise_error ActiveRecord::RecordInvalid
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
  describe  do
    context 'columns' do
      %i[id user_id image_id].each do |field|
        it { is_expected.to have_db_column field }
      end
    end
    context 'association' do
      it { is_expected.to belong_to :user }
      it { is_expected.to belong_to(:image).counter_cache(true) }
    end
    context 'validation' do
      let!(:like) { create(:like) }
      it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:image_id).
                  with_message('is already sets like to this image') }
    end
  end
end
