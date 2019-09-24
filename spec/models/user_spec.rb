require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validation tests" do
    # before(:context) do
    #   ActiveRecord::Migration.change_column_null :users, :email, true
    # end
    # after(:context) do
    #   ActiveRecord::Migration.change_column_null :users, :email, false
    # end

    it "is valid with valid attributes" do
      user = User.new(email: 'qwe@email.com', password: 'password', password_confirmation: 'password')
      expect(user.valid?).to eq(true)
    end
    it "ensures that email exist" do
      user = User.new(password: 'password', password_confirmation: 'password')
      expect(user.valid?).to eq(false)
    end
    # it "ensures that first name exist" do
    #   user = User.new(password: 'password', password_confirmation: 'password', email: 'qwe@email.com')
    #   expect(user.valid?).to eq(false)
    # end

  end
end
