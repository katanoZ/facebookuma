# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
    name: name,
    password: password,
    password_confirmation: password,
    )
end

1.upto 100 do |n|
  title = Faker::Book.title
  content = Faker::Hacker.say_something_smart
  Topic.create!(
    title: title,
    content: content,
    user_id: n,
    )
end
