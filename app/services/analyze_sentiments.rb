class AnalyzeSentiments < ApplicationService
  def initialize(answers)
    @answers = answers
  end

  def call
    # retrieve the answer
    # @form = Form.find(params[:id])
    # form_questions = @form.questions
    # answers = []
    # form_questions.each do |question|
    #   answer = question.answer
    #   answers << answer
    # end
    # raise
    questions_list = []
    replies_list = []
    # retrieve the question from the answer (Only take open-ended qns)
    @answers.each do |answer|
      next if answer.question.format == "multiple choice"

      reply = answer.value
      replies_list << reply
      question = answer.question.title
      questions_list << question
    end

    response = call_open_ai(questions_list, replies_list)

    counter = 0
    @answers.each_with_index do |answer, index|
      next if answer.question.format == "multiple choice"

      answer.update(sentiment_value: response[counter])
      counter += 1
    end
  end

  private

  def call_open_ai(questions_list, replies_list)
    # @answers

    # use chatgpt > give it the question & answer and ask for sentiment
    content = "
    Based on these questions: #{questions_list} and these answers: #{replies_list}, give me your opinions on the sentiments of the answers and return an array of floats from 0 - 10,
    (with 0 being the most negative and 10 being the most positive). The array of questions is related to their array of answers based on their index.
    Format your answer in an array of floats, showing just the sentiment value of the answers. nothing else"
    client = OpenAI::Client.new(access_token: ENV['OPENAI_TOKEN'])
    response = client.chat(
      parameters: {
        temperature: 1.0,
        model: 'gpt-3.5-turbo',
        messages: [
          { role: 'user',
            content: content
          }
        ]
      }
    )
    reply = response.dig('choices', 0, 'message', 'content')
    response = JSON.parse(reply)
    return response
  end
end

# AnalyzeSentiment.(answers)
