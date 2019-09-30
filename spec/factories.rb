# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: %i[admin admin_user] do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now }
  end

  factory :category do
    user
    name { 'test' }

      factory :category_with_owner_id do
        before(:create) { |category| User.find_by(id: category.owner_id) || create(:user, id: category.owner_id) }
      end
  end

  factory :image do
    category
    path { Rails.root.join('app', 'assets', 'images', 'categories', 'cars', '239145_main.jpg').open }

    factory :image_with_category_id do
      before(:create) { |img| create(:category, id: img.category_id) }
    end
  end

  factory :comment do
    user
    image
    body { Faker::Lorem.word }

      factory :comment_with_image_id do
        before(:create) { |comment| create(:image, id: comment.image_id) }
      end
      factory :comment_with_user_id do
        before(:create) { |comment| create(:user, id: comment.user_id) }
      end
  end

  factory :subscription do
    user
    category
      factory :subscription_with_user_id do
        before(:create) { |subscription| create(:user, id: subscription.user_id) }
      end
      factory :subscription_with_category_id do
        before(:create) { |subscription| create(:category, id: subscription.category_id) }
      end
    # factory :subscription_with_user_id_category_id do
    #   before(:create) do |subscription|
    #     if(User.find_by(id: subscription.user_id) && )
    #   end
    # end
  end

  factory :like do
    user
    image
      factory :like_with_image_id do
        before(:create) { |like| create(:image, id: like.image_id) }
      end
      factory :like_with_user_id do
        before(:create) { |like| create(:user, id: like.user_id) }
      end
  end

  factory :action do
    activity { ['navigation', 'likes', 'comments', 'user sign in', 'user sign out'].sample }
  end

  factory :log do
    user
    Action.find_by(id: [*1..5].sample) || action
    url { 'http://localhost:3000/images?locale=en' }
  end
end
