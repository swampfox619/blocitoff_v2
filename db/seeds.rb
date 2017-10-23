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

2.times do
    user = User.last
    
    Item.create!(
        user: user,
        name: 'Play ' + Faker::Team.sport + ' this weekend',
        order: user.items.count + 1
    )
    Item.create!(
        user: user,
        name: 'Learn ' + Faker::Music.instrument.to_s,
        order: user.items.count + 1
    )
    Item.create!(
        user: user,
        name: 'Learn the ' + Faker::ProgrammingLanguage.name.to_s + ' programming language',
        order: user.items.count + 1
    )    
    Item.create!(
        user: user,
        name: 'Read ' + Faker::Book.title.to_s,
        order: user.items.count + 1
    )
    Item.create!(
        user: user,
        name: 'Download the ' + Faker::App.name.to_s + ' app',
        order: user.items.count + 1
    )   
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} topics created"
