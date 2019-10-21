

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  context 'test checks that' do
    let(:category) { create(:category) }

    it '\'find_category_rating\' helper returns correct rating after creating and deleting items' do
      # rating is images count + likes count + comments count
      image = create(:image, category_id: category.id)
      category.reload
      expect(helper.find_category_rating(category)).to eq(1)

      like = create(:like, image_id: image.id, user_id: category.user.id)
      category.reload
      expect(helper.find_category_rating(category)).to eq(2)

      comment = create(:comment, image_id: image.id, user_id: category.user.id)
      category.reload
      expect(helper.find_category_rating(category)).to eq(3)

      like.destroy
      category.reload
      expect(helper.find_category_rating(category)).to eq(2)

      comment.destroy
      category.reload
      expect(helper.find_category_rating(category)).to eq(1)
    end
    # OPTIMIZE: THIS TEST
    it '\'find_category_rating\' helper returns correct rating with few images/likes/comments' do
      5.times { create(:image, category_id: category.id) }
      5.times do
        create(:like, image_id: Image.first.id)
        create(:comment, image_id: Image.first.id)
      end
      4.times do
        create(:like, image_id: Image.second.id)
        create(:comment, image_id: Image.second.id)
      end
      3.times do
        create(:like, image_id: Image.third.id)
        create(:comment, image_id: Image.third.id)
      end
      2.times do
        create(:like, image_id: Image.fourth.id)
        create(:comment, image_id: Image.fourth.id)
      end
      create(:like, image_id: Image.fifth.id)
      create(:comment, image_id: Image.fifth.id)
      expected_rating = Image.count + Like.count + Comment.count
      expect(helper.find_category_rating(category)).to eq(expected_rating)
    end
    it 'find_categories_rating elements sorted desc' do
      image = create(:image)
      create(:like, image_id: image.id, user_id: image.category.user.id)
      create(:comment, image_id: image.id, user_id: image.category.user.id)
      create(:like)
      expect(helper.find_categories_rating.first[:rating]).to be > helper.find_categories_rating.second[:rating]
    end
    it 'avatar_to_display helper returns \'avatar\' if user doesnt have avatar' do
      user = create(:user)
      sign_in user
      expect(helper.avatar_to_display).to eql'avatar'
    end
    it 'avatar_to_display helper returns an avatar if user have one' do
      user = create(:user_with_avatar)
      sign_in user
      expect(helper.avatar_to_display).to match /\A.*\.\w+\z/
    end
    it 'find_locale helper returns default value if it isn`t set in user and params' do
      expect(helper.find_locale.to_s).to eq('en')
    end
    it 'find_locale helper returns value from params if it isn`t set in user' do
      controller.params[:locale] = 'pl'
      expect(helper.find_locale.to_s).to eq('pl')
    end
    it 'find_locale helper returns value from params if it isn`t set in user' do
      user = create(:user, locale: 'ru')
      sign_in user
      controller.params[:locale] = 'pl'
      allow(helper).to receive(:current_user).and_return(user)
      expect(helper.find_locale.to_s).to eq('ru')
    end

  end
end
