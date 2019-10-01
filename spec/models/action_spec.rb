# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Action, type: :model do
  subject { create(:action) }
  let(:permitted_activities) { ['navigation', 'likes', 'comments', 'user sign in', 'user sign out'] }
  context 'validation test' do
    it 'ensures that action valid with valid attributes' do
      expect(subject.valid?).to be true
    end
    it 'ensures that valid action has activity from a valid list' do
      expect(permitted_activities).to include(subject.activity)
    end
    it 'ensures that action invalid without activity' do
      subject.activity = nil
      expect(subject.valid?).to be false
    end
    it 'ensures that action invalid with wrong activity' do
      # TODO: EXCEPT PERMITTED_ACTIVITIES WORDS
      subject.activity = Faker::Lorem.word
      expect(subject.valid?).to be false
      # expect(permitted_activities).to_not include(subject.activity)
    end
    it 'ensures that all activities exist' do
      permitted_activities.each do |action|
        expect { Action.find_by(activity: action) }.to_not raise_error
      end
    end
  end
  context 'method' do
    it 'to_s is a string' do
      expect(subject.to_s.class).to be String
    end
    it 'to_s returns value is included in the permitted_activities' do
      expect(permitted_activities).to include(subject.to_s)
    end
  end
end
