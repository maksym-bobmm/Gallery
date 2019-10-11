# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }
  context 'validation test' do
    it 'is valid with valid attributes' do
      expect(subject.valid?).to be true
    end
    it 'ensures that email exist' do
      subject.email = nil
      expect(subject.valid?).to be false
    end
    # it 'ensures that first name exist' do
    #   user = User.new(password: 'password', password_confirmation: 'password', email: 'qwe@email.com')
    #   expect(user.valid?).to eq(false)
    # end
  end
  context 'associations test' do
    let(:id) { 500 }
    it 'ensures that after user drop categories not exist' do
      category = create(:category)
      id = category.id
      category.user.destroy
      expect(Category.where(id: id).count).to eq(0)
    end
    it 'ensures that user exist after create' do
      create(:user, id: id)
      expect { User.find(id) }.to_not raise_error
    end
    it 'ensures that user have a category after create one' do
      create(:category_with_owner_id, id: id, owner_id: id)
      expect { User.find(id).categories.find(id) }.to_not raise_error
    end
  end
  context 'method' do
    it 'to_s must return string' do
      expect(subject.to_s.class).to be String
    end
    it 'to_s must be an email format' do
      expect(subject.to_s).to match /\w{1}[\w\d]+\.?[\w\d]+@{1}\w+\.\w+/
    end
  end
end
