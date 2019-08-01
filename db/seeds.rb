# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Action.create!(id: 1, activity: 'navigation')
Action.create!(id: 2, activity: 'likes')
Action.create!(id: 3, activity: 'comments')
Action.create!(id: 4, activity: 'user sign in')
Action.create!(id: 5, activity: 'user sign out')
