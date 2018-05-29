
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting"
Request.destroy_all

puts "creating"

20.times { Request.create!(
            name: Faker::Name.name,
            email: Faker::Internet.email,
            phone_number: "0" + rand(100000000..599999999).to_s,
            bio: Faker::HowIMetYourMother.quote) }
puts "done"
