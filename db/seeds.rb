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
  { title: "HTML", category_id: categories[0].id , author_id: users[0].id }, 
  { title: "Ruby", category_id: categories[1].id , author_id: users[1].id}
])

questions = Question.create!([
  { name: "What is the most popular framework?", test_id: tests[1].id }, 
  { name: "Are all tags paired?", test_id: tests[0].id }
])

results = Result.create!([
  { points: 50, user_id: users[1].id, test_id: tests[0].id }, 
  { points: 100, user_id: users[0].id, test_id: tests[0].id },
  { points: 100, user_id: users[0].id, test_id: tests[1].id } 
])
