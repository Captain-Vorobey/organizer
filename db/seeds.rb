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

user = User.create(email: 'dima12345@mail.ru', password: 'admin123', name: 'Dima').add_role :admin

address = Address.create(city: 'Minsk',
                         street: 'Platonova',
                         houseNumber: 444,
                         addressable_type: 'Company')

company = Company.create(name: '2English', description: 'We offer you English courses', address_id: address.id)

time_limit = TimeLimit.create(start_time: '2020-12-10 10:00:00',
                              end_time: '2020-12-30 18:00:00', user_id: user.id, length: 45)

service = Service.create(name: 'Test Service',
                 description: Faker::Food.description,
                 company_id: company.id,
                 time_limit_id: time_limit.id,
                 user_id: user.id)

time_limit.service_id = service.id