# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "faker"

#Clean up
Comment.delete_all
Follow.delete_all
Message.delete_all
Participant.delete_all
Room.delete_all
Post.delete_all
User.delete_all
Role.delete_all
Category.delete_all

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

10.times { |i| Category.create(name: "Category #{i}") }

puts "Categories created"

User.create(
  first_name: "Admin01",
  last_name: "Admin01",
  username: "Admin01",
  email: "admin01@test.org",
  password: "password",
  role_id: 3,
)
puts "admin created"

10.times do |i|
  User.create(
    first_name: "Publisher#{i}",
    last_name: "Publisher#{i}",
    username: "Publisher#{i}",
    email: "publisher#{i}@test.org",
    password: "password",
    role_id: 2,
  )
end

puts "Publishers created"

9.times do |i|
  User.create(
    first_name: "Standard#{i}",
    last_name: "Standard#{i}",
    username: "Standard#{i}",
    email: "standard#{i}@test.org",
    password: "password",
    role_id: 1,
  )
end

puts "Standard Users created"

5.times { |i| Room.create(name: "Room#{i}", is_private: false) }

puts "Rooms created"

30.times do |i|
  Post.create(
    title: "Post#{i}",
    subtitle: "Nihil molestiae consequatur, vel illum qui dolorem eum",
    content:
      "Duis aute irure dolor in reprehenderit in voluptate velit. Laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat. Sed ut perspiciatis unde omnis iste natus error sit voluptatem. Fugiat quo voluptas nulla pariatur? Itaque earum rerum hic tenetur a sapiente delectus. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque. Architecto beatae vitae dicta sunt explicabo. Sed ut perspiciatis unde omnis iste natus error sit voluptatem. Accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo. Facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Corrupti quos dolores et quas molestias excepturi sint occaecati. Fugiat quo voluptas nulla pariatur? Nihil molestiae consequatur, vel illum qui dolorem eum. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Architecto beatae vitae dicta sunt explicabo. Cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Animi, id est laborum et dolorum fuga.",
    category_id: rand(1..10),
    user_id: rand(1..20),
  )
end

puts "Posts created"

30.times do |i|
  Comment.create(
    name: "Comment#{i}",
    body:
      "Ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat. Duis aute irure dolor in reprehenderit in voluptate velit. Totam rem aperiam. Nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam.",
    post_id: rand(1..30),
    user_id: rand(1..20),
  )
end

puts "Comments created"

15.times { { followee_id: rand(1..20), follower_id: rand(1..20) } }

puts "Follows created"

# 20.times do
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     username: Faker::Internet.username,
#     email: Faker::Internet.email,
#     password: "password",
#     role_id: Faker::Number.between(from: 1, to: 3),
#     bio: Faker::Lorem.paragraphs(number: 1, supplemental: true),
#   )
# end

# puts "Users created"

# 100.times do |i|
#   post = Post.where(title: "Post #{i}").first_or_create
#   post.update(
#     subtitle: Faker::Lorem.sentences(number: 2, supplemental: true),
#     content: Faker::Lorem.paragraphs(number: 6, supplemental: true),
#     category_id: Faker::Number.between(from: 1, to: 10),
#     user_id: Faker::Number.between(from: 1, to: 20),
#   )
# end

# puts "Posts created"

# 30.times do |count|
#   Comment.create(
#     name: Faker::Lorem.sentence,
#     body: Faker::Lorem.sentences(number: 5, supplemental: true),
#     post_id: Faker::Number.between(from: 1, to: 46),
#     user_id: Faker::Number.between(from: 1, to: 20),
#   )
# end

# puts "Comments created"

# 5.times { Room.create(name: Faker::Lorem.word, is_private: false) }

# puts "Rooms created"

# 15.times do |count|
#   Follow.create(
#     follower_id: Faker::Number.between(from: 1, to: 20),
#     followee_id: Faker::Number.between(from: 1, to: 20),
#   )
# end

# puts "Follows created"

# # puts "\n== Seeding the database with fixtures =="
# # system("bin/rails db:fixtures:load")
