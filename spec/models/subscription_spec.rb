# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'vaqlidations test' do
    subject { create(:subscription) }
    it 'ensures that subscription is valid with valid params' do
      expect(subject.valid?).to be true
    end
    it 'ensures that subscription is not valid without user_id' do
      subject.user_id = nil
      expect(subject.valid?).to be false
    end
    it 'ensures that subscription is not valid without category_id' do
      subject.category_id = nil
      expect(subject.valid?).to be false
    end
  end

  context 'associations test' do
    subject { create(:subscription) }
    let(:id) { 500 }
    it 'ensures that subscription contain user' do
      expect(subject.user).to be_persisted
    end
    it 'ensures that subscription contain category' do
      expect(subject.category).to be_persisted
    end
    it 'ensures that user contain subscription after create one' do
      create(:subscription_with_user_id, id: id, user_id: id)
      expect(User.find(id).subscriptions.find(id)).to be_present
    end
    it 'ensures that category contain subscription after create one' do
      create(:subscription_with_category_id, id: id, category_id: id)
      expect(Category.find(id).subscriptions.find(id)).to be_present
    end
  end
end
