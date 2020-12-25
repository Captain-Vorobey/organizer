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

address = Address.create(city: "Minsk", 
                        street: "Platonova", 
                        houseNumber: 444, 
                        addressable_type: "Company")

company = Company.create(name: "Amazon", description: "Something here", address_id: address.id)

3.time do 
  TimeLimit.create(start_time: "2020-12-10 10:00:00", 
                   end_time: "2020-12-30 18:00:00", user_id: current_user.id, length: "2020-12-19 00:30:00")
end

3.times do
  Service.create(name: 'Some service',
                 description: Faker::Food.description,
                 avatar: Faker::Fillmurray.image, company_id: 1)
end

# Company.create(name: 'Amazon', description: 'We cooking the most delicious burgers', avatar: 'logo.jpeg', services: services, address: Address.create(city: Faker::Address.city, street: Faker::Address.street_name, houseNumber: Faker::Address.building_number))
