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

user = User.create(email: "admin@mail.ru", password: "admin123", name: "Dima").add_role :admin

address = Address.create(city: "Minsk", 
                        street: "Platonova", 
                        houseNumber: 444, 
                        addressable_type: "Company")

company = Company.create(name: "2English", description: "We offer you English courses", address_id: address.id)

time_limit = TimeLimit.create(start_time: "2020-12-10 10:00:00", 
                 end_time: "2020-12-30 18:00:00", user_id: 1, length: 45)

services = 3.times do
  Service.create(name: 'Service',
                 description: Faker::Food.description, company_id: company.id, time_limit_id: time_limit.id)
end

# Company.create(name: 'Amazon', description: 'We cooking the most delicious burgers', avatar: 'logo.jpeg', services: services, address: Address.create(city: Faker::Address.city, street: Faker::Address.street_name, houseNumber: Faker::Address.building_number))
