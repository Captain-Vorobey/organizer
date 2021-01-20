# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# -----------
# There are not working seeds
# -----------

Role.create(name: 'customer')
Role.create(name: 'admin')
Role.create(name: 'owner')

user = User.create(email: 'admin@mail.ru', password: 'password', name: 'Dima').add_role 'admin'
user = User.create(email: 'owner@mail.ru', password: 'password', name: 'Egor').add_role 'owner'
user = User.create(email: 'user@mail.ru', password: 'password', name: 'Nikita').add_role 'customer'

if Rails.env.development?
  AdminUser.create!(email: 'dima@mail.ru', password: 'password', password_confirmation: 'password')
end
