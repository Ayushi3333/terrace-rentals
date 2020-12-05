# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Terrace.destroy_all
addresses = ["Barcelona, Spain", "Paris, France", "Brussels, Belgium", "Amsterdam, Netherlands", "London, UK"]
5.times do
  Terrace.create!(
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    size: rand(10..80),
    floor: rand(1..25),
    price: rand(50..1000),
    address: addresses.sample(1)
  )
  puts "Created #{Terrace.count} terraces."
end