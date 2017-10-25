# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.create!(
    email: 'lew.vine@gmail.com',
    password: 'password',
    confirmed_at: Time.now
    )

events = ["Clicked contact page from homepage", "Clicked contact page from services page", "Clicked contact page from gallery page", "Submitted contact form", "Submitted e-mail newsletter registration"]
apps = RegisteredApplication.all
user_one = User.last

10.times do
    RegisteredApplication.create!(
        name: Faker::Internet.domain_word,
        url: 'www.' + Faker::Internet.domain_word + '.com',
        user_id: user_one.id
        ) 
end


50.times do
    Event.create!(
        name: events.sample,
        registered_application_id: apps.sample.id,
        )
end

puts "Seed finished"
puts "#{RegisteredApplication.count} apps created"
puts "#{Event.count} events created"
