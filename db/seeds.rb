# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Clean up 
Category.delete_all
User.delete_all

puts 'Categories deleted'
puts 'Users deleted'

#Seeding
# User.create!(first_name: "Test01", last_name: "Test01", username: "Test01", email: "test01@test.org", password: "password")
# User.create(username: "Test02", email: "test02@test.org")
# User.create(username: "Test03", email: "test03@test.org")

# puts "Users created"

# Category.create(name:'What is new?')
# Category.create(name:'Lifestyle')
# Category.create(name:'Retail')
# Category.create(name:'Architeture')

# puts "Categories created"

puts "\n== Seeding the database with fixtures =="
system("bin/rails db:fixtures:load")