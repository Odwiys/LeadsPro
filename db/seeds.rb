# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "destroying option"
Option.destroy_all
p "destroying answer"
Answer.destroy_all
p "destroying qn"
Question.destroy_all
p "destroying Response"

Response.destroy_all
Form.destroy_all
Lead.destroy_all
Campaign.destroy_all
User.destroy_all

puts "Database clean!"

puts "Creating users..."
agent_one = User.create!(
  name: 'agent one',
  email: 'one@email.com',
  phone_number: '91425122',
  cea_number: 'R123456A',
  password: '123123'
)

agent_two = User.create!(
  name: 'agent two',
  email: 'two@email.com',
  phone_number: '85173252',
  cea_number: 'R654321C',
  password: '321321'
)
puts "Users done! 🚀"

puts "Creating campaigns..."
campaign_one = Campaign.create!(
  name: 'Marina One Residences',
  date_created: Date.today - 1.week,
  details: 'Lead generation campaign',
  user: agent_one
)

campaign_two = Campaign.create!(
  name: 'Cityhub',
  date_created: Date.today,
  details: 'Lead generation campaign',
  user: agent_one
)
puts "Campaigns done!"

puts "Creating forms..."
form_one = Form.create!(
  title: 'Welcome to Marina One Residences',
  campaign: campaign_one
)
puts "Forms done!"

lead_one = Lead.create!(
  name: 'Zohan',
  email:'zohan@animal.com',
  phone_number: '9123912',
  rating: 0.1
)

response_one = Response.create!(
  form: form_one,
  lead: lead_one
)

question_one = Question.create(
  title: 'What is your name?',
  format: 'open ended',
  form: form_one
)

question_two = Question.create(
  title: 'What is your email?',
  format: 'open ended',
  form: form_one
)

question_three = Question.create(
  title: 'What is your phone number?',
  format: 'open ended',
  form: form_one
)

question_four = Question.create(
  title: 'What property type are you interested in?',
  format: 'multiple choice',
  form: form_one
)

question_five = Question.create(
  title: 'Do you have a budget in mind? please indicate a rough range',
  format: 'open ended',
  form: form_one
)

question_six = Question.create(
  title: 'When are you available for a meeting/viewing?',
  format: 'open ended',
  form: form_one
)

question_seven = Question.create(
  title: 'Are you already working with an agent?',
  format: 'multiple choice',
  form: form_one
)

option_one = Option.create(
  value: 'HDB',
  question: question_four
)

option_two = Option.create(
  value: 'Condominium',
  question: question_four
)

option_three = Option.create(
  value: 'Landed Property',
  question: question_four
)

option_four = Option.create(
  value: 'Yes',
  question: question_seven
)

option_five = Option.create(
  value: 'No',
  question: question_seven
)

answer_one = Answer.create(
  value: 'Zohan',
  response: response_one,
  question: question_one
)

answer_two = Answer.create(
  value: 'zohan@animal.com',
  response: response_one,
  question: question_two
)

answer_three = Answer.create(
  value: '9123912',
  response: response_one,
  question: question_three
)

answer_four = Answer.create(
  value: 'Condominium',
  response: response_one,
  question: question_four
)

answer_five = Answer.create(
  value: '$800,000',
  response: response_one,
  question: question_five
)

answer_six = Answer.create(
  value: 'Next week',
  response: response_one,
  question: question_six
)

answer_seven = Answer.create(
  value: 'No',
  response: response_one,
  question: question_seven
)

puts 'seed ok'
