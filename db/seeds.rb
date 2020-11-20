# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do 
    User.create(email: Faker::Internet.email,
                password: '123qweasd')
end

company = Company.create(name: 'Amazon')

address = Address.new(city: 'Borisov', addressable: company)

company = Company.create(name: 'Amazon', address_id: 1)

10.times do 
    Service.create(name: 'Some service',
                    description: 'And its description',
                    avatar: 'lisica.png', company_id: 1)
end

10.times do
    Address.create(city: Faker::Address.city, street: Faker::Address.street_name, houseNumber: Faker::Address.building_number)
end

#Company.create(name: 'Amazon', description: 'We cooking the most delicious burgers', avatar: 'logo.jpeg', services: services, address: Address.create(city: Faker::Address.city, street: Faker::Address.street_name, houseNumber: Faker::Address.building_number))