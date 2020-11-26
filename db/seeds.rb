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

10.times do
  Service.create(name: 'New service',
                 description: Faker::Food.description,
                 avatar: Faker::Fillmurray.image, company_id: 1)
end

# Company.create(name: 'Amazon', description: 'We cooking the most delicious burgers', avatar: 'logo.jpeg', services: services, address: Address.create(city: Faker::Address.city, street: Faker::Address.street_name, houseNumber: Faker::Address.building_number))
