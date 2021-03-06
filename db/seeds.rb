# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kuma_array = [
  {name: "白くま", email: "sirokuma@kuma.com", image: "kuma01.png", description: "寒冷地に適応した白くまです。体毛に藻が生えるとミドリグマと呼ばれます。"},
  {name: "黒くま", email: "kurokuma@kuma.com", image: "kuma02.png", description: "黒くまです。動くものを追いかけるくまー。"},
  {name: "眠いくま", email: "nemuikuma@kuma.com", image: "kuma03.png", description: "おやすみなさい。"},
  {name: "目つきの悪いくま", email: "metukinowaruikuma@kuma.com", image: "kuma04.png", description: "目つきは悪いけどこころは優しいくまです。たぶん。"},
  {name: "ジャイアントパンダ", email: "giantpanda@kuma.com", image: "kuma05.png", description: "竹食などの草食傾向が比較的強いが、機会があれば生肉食を拒まない。"},
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
  user.description = kuma[:description]

  if user.save
    user.create_kuma_topic
  end
end
