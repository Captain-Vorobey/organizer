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


address = Address.create(city: 'Minsk',
    street: 'Platonova',
    houseNumber: 444,
    addressable_type: 'Company')

company = Company.create(name: '2English', description: 'We offer you English courses', address_id: address.id)

time_limit = TimeLimit.create(start_time: '2020-12-10 10:00:00',
         end_time: '2020-12-30 18:00:00', user_id: 2, length: 45)

3.times do service = Service.create(name: 'Test Service',
  description: Faker::Food.description,
  company_id: company.id,
  time_limit_id: time_limit.id,
  user_id: 2)
end

#time_limit.service_id = service.idUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?