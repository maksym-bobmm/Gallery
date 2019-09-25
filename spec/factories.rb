FactoryBot.define do
  factory :user, aliases: %i[admin admin_user ] do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory :category do
    user
    name {'test'}

    factory :category_id do
      before(:create) do |category|
        create(:user, id: category.owner_id)
      end
    end
  end
  factory :image do
    category
    path { Rails.root.join('app', 'assets', 'images', 'categories', 'cars', '239145_main.jpg').open }

    factory :image_id do
      before(:create) do |img|
        create(:category, id: img.category_id)
      end
    end
  end

  factory :comment do
    user
    image
    body { Faker::Lorem.word }
  end
  factory :subscription do
    user
    category
  end
  factory :like do
    user
    image
  end
  factory :action do
    type { FAKER::Lorem.word }
  end
  factory :log do
    user
    action
  end
end