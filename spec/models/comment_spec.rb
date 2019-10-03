# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
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
