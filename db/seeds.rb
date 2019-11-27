# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Clean database...'

User.destroy_all
Transaction.destroy_all

puts 'Creating 25 fake user...'
15.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
  )
  user.save!

  3.times do
    seedpackage = Seedpackage.new(
    name:    Faker::Company.name,
    description: Faker::Lorem.sentence,
    location: Faker::Address.full_address,
    photo: Faker::Internet.url,
    package_price: Faker::Number.between(from: 1, to: 10),
    user: user,
    )
    seedpackage.save!
  end

end

10.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
  )
  user.save!
end

puts 'Finished!'

puts "user created : #{User.count} "
puts "seedpackage created : #{Seedpackage.count} "
