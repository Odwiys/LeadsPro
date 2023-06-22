# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Campaign.destroy_all
Form.destroy_all
Lead.destroy_all
Response.destroy_all
Answer.destroy_all
Question.destroy_all
Option.destroy_all

puts "Database clean!"

user = User.create!(
  email: 'email@email.com',
  password: '123123'
)

campaign = Campaign.create!(
  name: 'Test Campaign',
  user:
)

form = Form.create!(
  campaign:,
  title: 'Form 1'
)

lead = Lead.create!(
  name: 'Zohan',
  email:'zohan@animal.com',
  phone_number: '9123912',
  rating: 0.1
)

response = Response.create!(
  form:, lead:
)

question = Question.create(
  title: 'this is question',
  form:
)

answer = Answer.create(
  value: 'correct',
  response:, question:
)

option = Option.create(
  value: 'this one?',
  question:
)

puts 'seed ok'
