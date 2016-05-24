# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#User
2.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'helloworld'
    )
end

users = User.all

#Create fake registered applications
5.times do 
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Company.name,
    url: Faker::Internet.url
    )
end

regapps = RegisteredApplication.all

# #Create fake events
10.times do 
  Event.create!(
    registered_application: regapps.sample,
    name: Faker::Commerce.department(1, true)
    )
end

events = Event.all


puts "Seeds finished"
puts "#{users.count} Users created"
puts "#{regapps.count} Registered Applications created"
puts "#{events.count} Events created"





