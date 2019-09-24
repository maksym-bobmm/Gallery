FactoryBot.define do
  factory :user do
    id { 500 }
    email {'qwe@email.example'}
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory :category do
    user
    owner_id { user.id }
    name {'test'}
  end
end