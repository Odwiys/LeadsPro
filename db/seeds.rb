# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)

require 'faker'

p "destroying option"
Option.destroy_all
p "destroying answer"
Answer.destroy_all

p "destroying UserQuestions"
UserQuestion.destroy_all
p "destroying FormQuestions"
FormQuestion.destroy_all

p "destroying qn"
Question.destroy_all
p "destroying Response"
Response.destroy_all

p "destroying Form"
Form.destroy_all

p "destroying Campaign"
Campaign.destroy_all

p "destroying Lead"
Lead.destroy_all

p "destroying User"
User.destroy_all

puts "Database clean!"

# HEREE WEEE GOOOOOOOO


puts 'Creating questions'

question_one = Question.create!(
  title: 'What property type are you interested in?',
  format: 'multiple choice'
)

question_two = Question.create!(
  title: 'Do you have a budget in mind? please indicate a rough range',
  format: 'open ended'
)

question_three = Question.create!(
  title: 'When are you available for a meeting/viewing?',
  format: 'open ended'
)

question_four = Question.create!(
  title: 'Are you already working with an agent?',
  format: 'multiple choice'
)

question_five = Question.create!(
  title: 'When are you looking to purchase a home?',
  format: 'open ended'
)

question_six = Question.create!(
  title: 'Can you tell me why you are interested in buying a home?',
  format: 'open ended'
)

puts 'Questions Created'

puts 'Creating Options'

option_one = Option.create!(
  value: 'HDB',
  question: question_one,
  sentiment_value: 5.5
)

option_two = Option.create!(
  value: 'Condominium',
  question: question_one,
  sentiment_value: 7.2
)

option_three = Option.create!(
  value: 'Landed Property',
  question: question_one,
  sentiment_value: 8.8
)

option_four = Option.create!(
  value: 'Not sure yet',
  question: question_one,
  sentiment_value: 2
)

option_five = Option.create!(
  value: 'Yes',
  question: question_four,
  sentiment_value: 3.5
)

option_six = Option.create!(
  value: 'No',
  question: question_four,
  sentiment_value: 7.6
)

puts 'Options Created'

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

puts 'Creating UserQuestions for agent 1'

user_question_one = UserQuestion.create!(
  user_id: agent_one.id,
  question_id: question_one.id,
  compulsory: true
)

user_question_two = UserQuestion.create!(
  user_id: agent_one.id,
  question_id: question_two.id,
  compulsory: true
)

user_question_three = UserQuestion.create!(
  user_id: agent_one.id,
  question_id: question_three.id,
  compulsory: true
)

user_question_four = UserQuestion.create!(
  user_id: agent_one.id,
  question_id: question_four.id,
  compulsory: true
)

user_question_five = UserQuestion.create!(
  user_id: agent_one.id,
  question_id: question_five.id
)

user_question_six = UserQuestion.create!(
  user_id: agent_one.id,
  question_id: question_six.id
)

puts "Creating UserQuestions for agent 2..."

user_question_seven = UserQuestion.create!(
  user_id: agent_two.id,
  question_id: question_one.id,
  compulsory: true
)

user_question_eight = UserQuestion.create!(
  user_id: agent_two.id,
  question_id: question_two.id,
  compulsory: true
)

user_question_nine = UserQuestion.create!(
  user_id: agent_two.id,
  question_id: question_three.id
)

user_question_ten = UserQuestion.create!(
  user_id: agent_two.id,
  question_id: question_four.id
)

user_question_eleven = UserQuestion.create!(
  user_id: agent_two.id,
  question_id: question_five.id,
  compulsory: true
)

user_question_twelve = UserQuestion.create!(
  user_id: agent_two.id,
  question_id: question_six.id,
  compulsory: true
)

puts 'Creating UserQuestions DONE!'

puts "Creating campaigns for agent 1..."
campaign_one = Campaign.create!(
  name: 'Marina One Residences',
  date_created: Date.today - 1.week,
  details: 'Lead generation campaign',
  user: agent_one
)

campaign_two = Campaign.create!(
  name: 'Cityhub',
  date_created: Date.today,
  details: 'Cityhub campaign',
  user: agent_one
)

campaign_three = Campaign.create!(
  name: 'DUO Andaz Tower',
  date_created: Date.today - 3.week,
  details: 'Anabelle campaign',
  user: agent_one
)

puts "Creating campaigns for agent 2..."
campaign_four = Campaign.create!(
  name: 'Nyon Residences',
  date_created: Date.today - 4.week,
  details: 'Nyon lead gen campaign',
  user: agent_two
)

campaign_five = Campaign.create!(
  name: 'Avenue South Residences',
  date_created: Date.today,
  details: 'ASR campaign',
  user: agent_two
)

campaign_six = Campaign.create!(
  name: 'The Sail at Marina Bay',
  date_created: Date.today - 2.week,
  details: 'Rich people campaign',
  user: agent_two
)
puts "Campaigns done!"

puts "Creating forms..."
form_one = Form.create!(
  title: 'Welcome to Marina One Residences',
  campaign: campaign_one
)
form_two = Form.create!(
  title: 'Welcome to Cityhub',
  campaign: campaign_two
)
form_three = Form.create!(
  title: 'Welcome to DUO Andaz',
  campaign: campaign_three
)
form_four = Form.create!(
  title: 'Welcome to Nyon',
  campaign: campaign_four
)
form_five = Form.create!(
  title: 'Welcome to Avenue South Residences',
  campaign: campaign_five
)
form_six = Form.create!(
  title: 'Welcome to The Sail',
  campaign: campaign_six
)
puts "Forms done!"

puts 'Creating FormQuestions for all forms'

form_question_1 = FormQuestion.create!(
  form_id: form_one.id,
  question_id: question_one.id,
)

form_question_2 = FormQuestion.create!(
  form_id: form_one.id,
  question_id: question_two.id,
)

form_question_3 = FormQuestion.create!(
  form_id: form_one.id,
  question_id: question_three.id,
)

form_question_4 = FormQuestion.create!(
  form_id: form_one.id,
  question_id: question_four.id,
)

form_question_5 = FormQuestion.create!(
  form_id: form_one.id,
  question_id: question_five.id,
)

form_question_6 = FormQuestion.create!(
  form_id: form_one.id,
  question_id: question_six.id,
)

form_question_7 = FormQuestion.create!(
  form_id: form_two.id,
  question_id: question_one.id,
)

form_question_8 = FormQuestion.create!(
  form_id: form_two.id,
  question_id: question_two.id,
)

form_question_9 = FormQuestion.create!(
  form_id: form_two.id,
  question_id: question_three.id,
)

form_question_10 = FormQuestion.create!(
  form_id: form_two.id,
  question_id: question_four.id,
)

form_question_11 = FormQuestion.create!(
  form_id: form_two.id,
  question_id: question_five.id,
)

form_question_12 = FormQuestion.create!(
  form_id: form_two.id,
  question_id: question_six.id,
)

form_question_13 = FormQuestion.create!(
  form_id: form_three.id,
  question_id: question_one.id,
)

form_question_14 = FormQuestion.create!(
  form_id: form_three.id,
  question_id: question_two.id,
)

form_question_15 = FormQuestion.create!(
  form_id: form_three.id,
  question_id: question_three.id,
)

form_question_16 = FormQuestion.create!(
  form_id: form_three.id,
  question_id: question_four.id,
)

form_question_17 = FormQuestion.create!(
  form_id: form_three.id,
  question_id: question_five.id,
)

form_question_18 = FormQuestion.create!(
  form_id: form_three.id,
  question_id: question_six.id,
)

form_question_19 = FormQuestion.create!(
  form_id: form_four.id,
  question_id: question_one.id,
)

form_question_20 = FormQuestion.create!(
  form_id: form_four.id,
  question_id: question_two.id,
)

form_question_21 = FormQuestion.create!(
  form_id: form_four.id,
  question_id: question_three.id,
)

form_question_22 = FormQuestion.create!(
  form_id: form_four.id,
  question_id: question_four.id,
)

form_question_23 = FormQuestion.create!(
  form_id: form_four.id,
  question_id: question_five.id,
)

form_question_24 = FormQuestion.create!(
  form_id: form_four.id,
  question_id: question_six.id,
)

form_question_25 = FormQuestion.create!(
  form_id: form_five.id,
  question_id: question_one.id,
)

form_question_26 = FormQuestion.create!(
  form_id: form_five.id,
  question_id: question_two.id,
)

form_question_27 = FormQuestion.create!(
  form_id: form_five.id,
  question_id: question_three.id,
)

form_question_28 = FormQuestion.create!(
  form_id: form_five.id,
  question_id: question_four.id,
)

form_question_29 = FormQuestion.create!(
  form_id: form_five.id,
  question_id: question_five.id,
)

form_question_30 = FormQuestion.create!(
  form_id: form_five.id,
  question_id: question_six.id,
)

form_question_31 = FormQuestion.create!(
  form_id: form_six.id,
  question_id: question_one.id,
)

form_question_32 = FormQuestion.create!(
  form_id: form_six.id,
  question_id: question_two.id,
)

form_question_33 = FormQuestion.create!(
  form_id: form_six.id,
  question_id: question_three.id,
)

form_question_34 = FormQuestion.create!(
  form_id: form_six.id,
  question_id: question_four.id,
)

form_question_35 = FormQuestion.create!(
  form_id: form_six.id,
  question_id: question_five.id,
)

form_question_36 = FormQuestion.create!(
  form_id: form_six.id,
  question_id: question_six.id,
)

puts "Creating FormQuestions done"

Form.all.each do |form|
  puts "Creating Responses for form #{form.id}"
  3.times do
    puts "Creating leads"

    lead = Lead.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      rating: rand(0.0..10.0).round(1)
    )

    response = Response.create!(form: form, lead: lead)

    form.questions.each do |question|
      answer = Answer.new

      if question.format == "multiple choice"
        answer.value = question.options.sample.value
      elsif question.format == "open ended"
        answer.value = Faker::Markdown.emphasis
      else
        puts "Invalid format: #{question.format}"
      end

      answer.response = response
      answer.question = question

      if answer.save
        puts "saved answer #{answer.id}"
      else
        puts "error saving answer: #{answer.errors.full_messages}"
      end
    end


  end
end

# 10.times do |lead|
#   puts 'creating a new lead'
#     lead = Lead.new(
#       name: Faker::Name.name,
#       email: Faker::Internet.email,
#       phone_number: Faker::PhoneNumber.cell_phone,
#       rating: rand(0.0..10.0).round(1)
#     )


# end

# puts "Creating responses"

# response_1 = Response.create!(
#   lead_id: form_six,
#   form_id: question_six,
# )
