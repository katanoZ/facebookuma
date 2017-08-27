# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include ActionView::Helpers::AssetUrlHelper

kuma_names = %w(白くま 黒くま 眠いくま 目つきの悪いくま ジャイアントパンダ)
kuma_emails = %w(sirokuma@kuma.com kurokuma@kuma.com nemuikuma@kuma.com metukinowaruikuma@kuma.com giantpanda@kuma.com)
kuma_password = "kuma_password"
kuma_images = %w(kuma01.png kuma02.png kuma03.png kuma04.png kuma05.png)

#kuma_names.size.times do |n|
kuma_names.size.times do |n|
  User.create!(name: kuma_names[n], email: kuma_emails[n], password: kuma_password, password_confirmation: kuma_password, image_url: kuma_images[n], uid: User.create_unique_string, provider: "kuma_provider" + n.to_s)
end
