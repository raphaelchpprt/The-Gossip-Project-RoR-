# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
GossipXTag.destroy_all
PrivateMessage.destroy_all

a=1
10.times do
  city = City.create!(
    id: a,
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
    )
  a+=1
end

b=1
10.times do
  user = User.create!(
    id: b,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    email: Faker::Internet.email,
    age: Faker::Number.number(digits: 2),
    city_id: rand(City.first.id..City.last.id)
  )
  b+=1
end

c=1
20.times do
  gossip = Gossip.create!(
    id: c,
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: rand(User.first.id..User.last.id)
  )
  c+=1
end

d=1
10.times do
  tag = Tag.create!(
    id: d,
    title: "#" + Faker::Lorem.word
  )
  d+=1
end

i=1
20.times do
  GossipXTag.create(
    id: i,
    gossip_id: Gossip.find(i).id,
    tag_id: rand(Tag.first.id..Tag.last.id)
    )
  i+=1 
end

e=1
10.times do 
  PrivateMessage.create!(
    id: e,
    content: Faker::Quote.famous_last_words,
    recipient_id: rand(User.first.id..User.last.id), 
    sender_id: rand(User.first.id..User.last.id)
    )
  e+=1
end 