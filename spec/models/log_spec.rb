# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Log, type: :model do
  describe 'old' do
    context 'validate test' do
      subject { create(:log) }
      let(:regular_expr) { /\Ahttp[s]?.*/ }
      it 'ensures that log valid with valid parameters' do
        expect(subject.valid?).to be true
      end
      it 'ensures that log valid with valid url' do
        expect(subject.url).to match(regular_expr)
      end
      it 'ensures that log invalid without user_id' do
        subject.user_id = nil
        expect(subject.valid?).to be false
      end
      it 'ensures that log invalid without action_id' do
        subject.action_id = nil
        expect(subject.valid?).to be false
      end
      it 'ensures that log invalid without url' do
        subject.url = nil
        expect(subject.valid?).to be false
      end
      it 'ensures that log invalid with invalid url format' do
        subject.url = Faker::Lorem.word
        expect(subject.url).to_not match(regular_expr)
      end
    end
    context 'associations test' do
      subject { create(:log) }
      it 'ensures that action exists after log creating' do
        expect(subject.action).to be_present
      end
      it 'ensures that action exists after log creating' do
        expect(subject.user).to be_present
      end
    end
  end
  describe  do
    context 'columns' do
      %i[id user_id url created_at action_id].each do |field|
        it { is_expected.to have_db_column field }
      end
    end
    context 'associations' do
      %i[user action].each do |association|
        it { is_expected.to belong_to association }
      end
    end
    context 'validation' do
      %i[user action url].each do |field|
        it { is_expected.to validate_presence_of field }
      end
      it { is_expected.to allow_value('http://localhost:3000/images?locale=en').for(:url) }
    end
  end
end
