require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LikesHelper. For example:
#
# describe LikesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LikesHelper, type: :helper do
  context 'test checks that' do
    let(:image) { create(:image) }
    xit 'qwe' do
      sign_in image.category.user
      byebug
      create(:like, image_id: image.category.id, user_id: image.category.user.id)
      allow(helper).to receive(:current_user)
      expect(helper.already_liked?).to be true
    end
  end
end
