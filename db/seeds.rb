# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(6),
        confirmed_at: Time.now
    )
end

User.create!(
        email: 'lew.vine@gmail.com',
        password: 'password',
        confirmed_at: Time.now
    )

users = User.all

10.times do
    Item.create!(
        user: users.sample,
        name: 'Play ' + Faker::Team.sport + ' this weekend'
    )
    Item.create!(
        user: users.sample,
        name: 'Learn ' + Faker::Music.instrument.to_s
    )
    Item.create!(
        user: users.sample,
        name: 'Learn the ' + Faker::ProgrammingLanguage.name.to_s + ' programming language'
    )    
    Item.create!(
        user: users.sample,
        name: 'Read ' + Faker::Book.title.to_s
    )
    Item.create!(
        user: users.sample,
        name: 'Download the ' + Faker::App.name.to_s + ' app'
    )   
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} topics created"
