# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Clean up
Category.delete_all
Role.delete_all
User.delete_all
# Publisher.delete_all

puts "Categories deleted"
puts "Users deleted"
puts "Publishers deleted"

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

User.create!(
  first_name: "Test01",
  last_name: "Test01",
  username: "Test01",
  email: "test01@test.org",
  password: "password",
  role_id: 1,
)
User.create!(
  first_name: "Test02",
  last_name: "Test02",
  username: "Test02",
  email: "test02@test.org",
  password: "password",
  role_id: 2,
)

User.create!(
  first_name: "Test03",
  last_name: "Test03",
  username: "Test03",
  email: "test03@test.org",
  password: "password",
  role_id: 1,
)

User.create!(
  first_name: "Test04",
  last_name: "Test04",
  username: "Test04",
  email: "test04@test.org",
  password: "password",
  role_id: 3,
)

puts "Users created"

# Publisher.create!(user_id: 1)
# Publisher.create!(user_id: 2)
# Publisher.create!(user_id: 3)
# Publisher.create!(user_id: 4)

# puts "Publishers created"

Category.create(name: "What is new?")
Category.create(name: "Lifestyle")
Category.create(name: "Retail")
Category.create(name: "Architecture")

puts "Categories created"

Post.create(
  title: "Post01",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 1,
  user_id: 2,
)
Post.create(
  title: "Post02",
  subtitle:
    "Neque porro quisquam est, qui dolorem ipsum quia dolor sit. amet, consectetur, adipisci velit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 1,
  user_id: 2,
)
Post.create(
  title: "Post03",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 2,
  user_id: 2,
)
Post.create(
  title: "Post04",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 1,
  user_id: 3,
)
Post.create(
  title: "Post05",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 3,
  user_id: 3,
)
Post.create(
  title: "Post06",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 1,
  user_id: 2,
)
Post.create(
  title: "Post07",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 1,
  user_id: 2,
)
Post.create(
  title: "Post08",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 4,
  user_id: 2,
)

Post.create(
  title: "Post09",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 2,
  user_id: 2,
)
Post.create(
  title: "Post10",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 2,
  user_id: 2,
)

Post.create(
  title: "Post11",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 2,
  user_id: 1,
)

Post.create(
  title: "Post12",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 2,
  user_id: 2,
)

Post.create(
  title: "Post13",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 1,
  user_id: 3,
)
Post.create(
  title: "Post14",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 1,
  user_id: 3,
)

Post.create(
  title: "Post15",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 1,
  user_id: 3,
)

Post.create(
  title: "Post16",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 4,
  user_id: 3,
)

Post.create(
  title: "Post17",
  subtitle: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit.",
  content:
    "Fugiat quo voluptas nulla pariatur? Duis aute irure dolor in reprehenderit in voluptate velit. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam. Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.",
  category_id: 4,
  user_id: 4,
)

puts "Posts created"

# puts "\n== Seeding the database with fixtures =="
# system("bin/rails db:fixtures:load")
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?