require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validation test" do
    subject { build(:category) }
    # let!(:image) { build(:user) }
    it "valid with valid attributes" do
      # byebug
      expect(subject).to be_valid
    end
    it "ensures that owner_id exist" do
      subject.owner_id = nil
      expect(subject).to_not be_valid
    end
    it "ensures that name exist" do
      subject.name = nil
      expect(subject).not_to be_valid
    end
  end
  context "test" do
    it " test qwe" do
      user = create(:image)
      byebug
      expect(user).to_ be_valid
    end
  end
end
