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
  terraces = Terrace.new(
    title: Faker::Book.title,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    size: rand(10..80),
    floor: rand(1..25),
    price: rand(50..1000),
    address: addresses.sample
  )
  photos = []

  photo = URI.open('https://images.unsplash.com/photo-1603496195861-dc075ecf7e2b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80')
  photo_1 = URI.open('https://images.unsplash.com/photo-1528735000313-039ec3a473b0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80')
  photo_2 = URI.open('https://images.unsplash.com/photo-1559339352-11d035aa65de?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=967&q=80')
  photos << photo
  photos << photo_1
  photos << photo_2

  photos.each do |photo|
    terraces.photos.attach(io: photo, filename: 'buddy-avatar.png')
  end

  terraces.save!

  puts "Created #{Terrace.count} terraces."
end