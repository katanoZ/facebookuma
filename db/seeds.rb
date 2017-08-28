# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kuma_array = [
  {name: "白くま", email: "sirokuma@kuma.com", image: "kuma01.png"},
  {name: "黒くま", email: "kurokuma@kuma.com", image: "kuma02.png"},
  {name: "眠いくま", email: "nemuikuma@kuma.com", image: "kuma03.png"},
  {name: "目つきの悪いくま", email: "metukinowaruikuma@kuma.com", image: "kuma04.png"},
  {name: "ジャイアントパンダ", email: "giantpanda@kuma.com", image: "kuma05.png"},
]
kuma_password = "kumapass"

kuma_array.each do |kuma|
  user = User.new
  user.name = kuma[:name]
  user.email = kuma[:email]
  user.password = kuma_password
  user.password_confirmation = kuma_password
  user.image_url = kuma[:image]
  user.uid = User.create_unique_string
  user.provider = "kuma_provider"

  if user.save
    user.create_kuma_topic
  end
end
