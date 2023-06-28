require "openai"
OPENAI_TOKEN = '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'

# retrieve the answer
# retrieve the question from the answer
questions_list =  ["When are you looking to purchase/ rent a home?", "Can you tell me why you’re interested in buying/renting a home?", "do you have a budget in mind? please indicate a rough range", "What property type are you interested in?"]
replies_list = ["In about 3 months", "I want to invest in a property", "about 1 million", "condominium"]
# use chatgpt > give it the question & answer and ask for sentiment
content = "
Based on these questions: #{questions_list} and these answers: #{replies_list}, give me your opinions on the sentiments of the answers and return an array of floats from 0 - 10,
(with 0 being the most negative and 10 being the most positive). The array of questions is related to their array of answers based on their index.
Format your answer in an array of floats, showing just the sentiment value of the answers. nothing else"
client = OpenAI::Client.new(access_token: OPENAI_TOKEN)
response = client.chat(
  parameters: {
    temperature: 1.0,
    model: 'gpt-3.5-turbo',
    messages: [
      { role: 'user',
        content: content }
    ]
  }
)
# puts response
reply = response.dig('choices', 0, 'message', 'content')
puts reply
# return float
# attribute value to answers > sentiment_value
