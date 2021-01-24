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

# roles
Role.create(name: 'customer')
Role.create(name: 'admin')
Role.create(name: 'owner')

# users

admin = User.create(email: 'admin@mail.ru', password: 'password', name: 'Dima').add_role 'admin'
owner = User.create(email: 'owner@mail.ru', password: 'password', name: 'Egor').add_role 'owner'
user = User.create(email: 'user@mail.ru', password: 'password', name: 'Nikita').add_role 'customer'

# companies
english = Company.create(name: '2English', description: 'Creamy mascarpone cheese and custard layered between espresso and rum soaked house-made ladyfingers, topped with Valrhona cocoa powder.')
itechArt = Company.create(name: 'ItechArt', description: '28-day aged 300g USDA Certified Prime Ribeye, rosemary-thyme garlic butter, with choice of two sides.')
course_works = Company.create(name: 'Diploms', description: 'We offer you course works and diploms on good price and the best quantity')

# services
courses = Service.create(name: 'Test Service',
                         description: Faker::Food.description,
                         company_id: english.id,
                         user_id: owner.id)

soft = Service.create(name: 'Test Service',
                      description: Faker::Food.description,
                      company_id: itechArt.id,
                      user_id: owner.id)

diploms = Service.create(name: 'Test Service',
                         description: Faker::Food.description,
                         company_id: course_works.id,
                         user_id: owner.id)

# comments
comment = Comment.create(comment: 'bla bla bla', user_id: admin.id, service_id: courses.id)
comment = Comment.create(comment: 'bla bla bla', user_id: owner.id, service_id: courses.id)
comment = Comment.create(comment: 'bla bla bla', user_id: user.id, service_id: courses.id)

comment = Comment.create(comment: 'bla bla bla', user_id: admin.id, service_id: soft.id)
comment = Comment.create(comment: 'bla bla bla', user_id: user.id, service_id: soft.id)
comment = Comment.create(comment: 'bla bla bla', user_id: owner.id, service_id: soft.id)

comment = Comment.create(comment: 'bla bla bla', user_id: admin.id, service_id: diploms.id)
comment = Comment.create(comment: 'bla bla bla', user_id: owner.id, service_id: diploms.id)
comment = Comment.create(comment: 'bla bla bla', user_id: user.id, service_id: diploms.id)

# time_limits
first_service_time_limit = TimeLimit.create(start_time: '2021-01-22 10:15:00', end_time: '2021-03-22 18:00:00', user_id: owner.id, service_id: courses.id, length: 15)
second_service_time_limit = TimeLimit.create(start_time: '2021-01-20 10:00:00', end_time: '2021-02-15 19:00:00', user_id: owner.id, service_id: soft, length: 30)
third_service_time_limit = TimeLimit.create(start_time: '2021-01-22 11:00:00', end_time: '2021-02-25 20:00:00', user_id: owner.id, service_id: diploms, length: 45)

courses.time_limit = first_service_time_limit
soft.time_limit = second_service_time_limit
diploms.time_limit = third_service_time_limit
