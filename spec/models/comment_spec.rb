# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'old' do
    context 'validation test' do
      subject { create(:comment) }
      it 'ensure that comment valid with valid parameters' do
        expect(subject.valid?).to be true
      end
      it 'ensure that body field exist' do
        subject.body = nil
        expect(subject.valid?).to be false
      end
      it 'ensures that user_id exist' do
        subject.user_id = nil
        expect(subject.valid?).to be false
      end
      it 'ensures that image_id exist' do
        subject.image_id = nil
        expect(subject.valid?).to be false
      end
    end
    context 'associations test' do
      let(:id) { 500 }
      it 'ensure that image contain comment after creating one' do
        create(:comment_with_image_id, id: id, image_id: id)
        expect(Image.find(id).comments.find(id)).to be_present
      end
      it 'ensure that user contain comment after creating one' do
        create(:comment_with_user_id, id: id, user_id: id)
        expect(User.find(id).comments.find(id)).to be_present
      end
    end
  end
  describe  do
    context 'collumns' do
      %i[id body user_id image_id created_at updated_at].each do |field|
        it { should have_db_column field }
      end
    end
    context 'associations' do
      %i[user].each do |association|
        it { should belong_to association }
      end
      %i[image].each do |association|
        it { should belong_to(association).counter_cache(true) }
      end
    end
    context 'validation' do
      %i[body image user].each do |field|
        it { should validate_presence_of field }
      end
    end
  end
end
