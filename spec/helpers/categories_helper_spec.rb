# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CategoriesHelper. For example:
#
# describe CategoriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CategoriesHelper, type: :helper do
  context 'tests check that' do
    let(:category) { create(:category) }
    context 'signed in user' do
      before(:each) { sign_in category.user }
      it 'gets image with highest score' do
        create(:image, category_id: category.id)
        create(:image, category_id: category.id, likes_count: 5)
        expect(find_popular_image(category).likes_count).to eq(5)
      end
    end
  end
end
