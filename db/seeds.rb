# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

#Clean up
Category.delete_all
Role.delete_all
User.delete_all
Room.delete_all
Post.delete_all
Comment.delete_all
Follow.delete_all

puts "Categories deleted"
puts "Roles deleted"
puts "Users deleted"
puts "Rooms deleted"
puts "Posts deleted"
puts "Comments deleted"
puts "Follows deleted"

puts "Seeding data..."

#Seeding
Role.create({ name: 0, description: "Can read posts" })

Role.create(
  {
    name: 1,
    description: "Can read and create posts. Can update and destroy own posts",
  },
)
Role.create(
  { name: 2, description: "Can perform any CRUD operation on any resource" },
)

puts "Roles created"

10.times do |count|
  Category.create(name: Faker::Lorem.words(number: 3, supplemental: true))
end

puts "Categories created"

8.times do |count|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    role_id: 1,
    bio: Faker::Lorem.paragraphs(number: 1, supplemental: true),
  )
end

8.times do |count|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    role_id: 2,
    bio: Faker::Lorem.paragraphs(number: 1, supplemental: true),
  )
end

4.times do |count|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    role_id: 3,
    bio: Faker::Lorem.paragraphs(number: 1, supplemental: true),
  )
end

puts "Users created"

100.times do |count|
  Post.create(
    title: Faker::Book.title,
    subtitle: Faker::Lorem.sentences(number: 2, supplemental: true),
    content: Faker::Lorem.paragraphs(number: 6, supplemental: true),
    category_id: Faker::Number.between(from: 1, to: 10),
    user_id: Faker::Number.between(from: 1, to: 20),
  )
end

puts "Posts created"

30.times do |count|
  Comment.create(
    name: Faker::Lorem.sentence,
    body: Faker::Lorem.sentences(number: 5, supplemental: true),
    post_id: Faker::Number.between(from: 1, to: 46),
    user_id: Faker::Number.between(from: 1, to: 20),
  )
end

puts "Comments created"

5.times { Room.create(name: Faker::Lorem.word, is_private: false) }

puts "Rooms created"

15.times do |count|
  Follow.create(
    follower_id: Faker::Number.between(from: 1, to: 20),
    followee_id: Faker::Number.between(from: 1, to: 20),
  )
end

puts "Follows created"

# # puts "\n== Seeding the database with fixtures =="
# # system("bin/rails db:fixtures:load")
