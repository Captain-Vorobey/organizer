# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Address.destroy_all

rnd = Random.new

10.times do 
    Comment.create(text: "You givee fine service")
end

10.times do 
    User.create(email: Faker::Internet.email,
                password: '123qweasd').add_role :admin
end

10.times do
    Address.create(city: Faker::Address.city,
                    street: Faker::Address.street_name,
                    houseNumber: Faker::Address.building_number)
end

10.times do 
    Service.create(name: "Some service",
        description: "And its description",
        avatar: "lisica",
        comment_id: Comment.find(rand(Comment.minimum(:id)..Comment.maximum(:id))))
end