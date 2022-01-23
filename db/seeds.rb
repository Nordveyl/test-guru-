# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create!([
  { first_name: "Vitaly", last_name: "Kosikov" }, 
  { first_name: "Vadim", last_name: "Kosikov" }
])

categories = Category.create!([
  { name: "Frontend" }, 
  { name: "Backend" }
])

tests = Test.create!([
  { title: "HTML", category: categories[0] , author: users[0] }, 
  { title: "Ruby", category: categories[1] , author: users[1]}
])

questions = Question.create!([
  { name: "What is the most popular framework?", test: tests[1] }, 
  { name: "Are all tags paired?", test: tests[0] }
])
