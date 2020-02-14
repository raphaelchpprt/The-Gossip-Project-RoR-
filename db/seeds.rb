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
Comment.destroy_all

a=1
10.times do
  City.create!(
    id: a,
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
    )
  a+=1
end

b=1
10.times do
  User.create!(
    id: b,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    email: Faker::Internet.email,
    age: Faker::Number.number(digits: 2),
    city_id: rand(City.first.id..City.last.id),
    password: "mdpmdp"
  )
  b+=1
end
=begin
User.create(
  id: b,
  first_name: "Anonymous",
  last_name: "Anonymous",
  description: "Anonymous anonymous anonymous anonymous anonymous anonymous",
  email: "anonymous@anonymous.com",
  age: "anonymous",
  city_id: rand(City.first.id..City.last.id),
)
=end

c=1
20.times do
  Gossip.create!(
    id: c,
    title: "Fake Title " + c.to_s,
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: rand(User.first.id..User.last.id),
  )
  c+=1
end

d=1
10.times do
  Tag.create!(
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

20.times do
  Comment.create(
    content: Faker::Quote.famous_last_words,
    gossip_id: rand(Gossip.first.id..Gossip.last.id),
    user_id: rand(User.first.id..User.last.id)
  )
end