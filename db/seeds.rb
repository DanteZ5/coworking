
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning"
Request.destroy_all

puts "creating"

20.times { Request.create!(
            name: Faker::StarWars.character,
            email: Faker::Internet.email,
            phone_number: "0" + rand(100000000..599999999).to_s,
            bio: Faker::Seinfeld.quote) }

requests = Request.all
requests[4,5].each { |request| request.update(status: "confirmed")}
requests[9,5].each { |request| request.update(status: "accepted")}
requests[14,5].each { |request| request.update(status: "expired")}



puts "done"
