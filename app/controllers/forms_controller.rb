class FormsController < ApplicationController
  def new
    @form = Form.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @form = Form.new(form_params)
    @campaign = Campaign.find(params[:campaign_id])
    @question = Question.new
    @form_question = FormQuestion.new
    @user_questions = current_user.user_questions
    @user_questions.each do |user_question|
      @form.questions << user_question.question if user_question.compulsory
    end
    @form_question.form = @form
    @form.campaign = @campaign
    @campaign.user = current_user

    if @form.save
      redirect_to edit_campaign_form_path(@campaign, @form)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @form = Form.find(params[:id])
  end

  def edit
    @question = Question.new

    @form = Form.find(params[:id])
    @lead = Lead.new
    @campaign = Campaign.find(params[:campaign_id])
    @previous_questions = UserQuestion.non_compulsory_questions_for(current_user) - @form.questions
  end

  def update
    if params.dig("form", "questions").present?
      questionids = params.dig("form", "questions").split(",")
      questions = Question.where(id: questionids)
      @form = Form.find(params[:id])
      @form.questions << questions
    end

    # render json: { msdg: questionids }
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json do
        render json: {
          questions_partial: render_to_string(partial: "question_list", locals: { questions: }, formats: [:html])
        }
      end
    end
  end

  def sentiment
    # retrieve the answer
    @response = Response.find(params[:response_id])
    @form = Form.find(params[:id])
    form_questions = @form.questions
    answers = []
    answers = form_questions.map do |question|
      answer = question.answers.find { |answer| }
      answers << answer
    end
    questions_list = []
    replies_list = []
    # retrieve the question from the answer (Only take open-ended qns)
    answers.each do |answer|
      next if answer.question.format == "multiple choice"

      reply = answer.value
      replies_list << reply
      question = answer.question.title
      questions_list << question
    end
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
    puts reply
    # return float
    # attribute value to answers > sentiment_value
    answers.each_with_index do |answer, index|
      next if answer.blank?

      single_answer = Answer.find_by(value: answer)
      single_answer&.update(sentiment_value: reply[index] || 0.0)
    end
  end


  # def sentiment_draft
  #   # retrieve the answer
  #   @form = Form.find(params[:id])
  #   form_questions = @form.questions
  #   answers = []
  #   form_questions.each do |question|
  #     answer = question.answer
  #     answers << answer
  #   end
  #   questions_list = []
  #   replies_list = []
  #   # retrieve the question from the answer (Only take open-ended qns)
  #   answers.each do |answer|
  #     next if answer.question.format == "multiple choice"

  #     reply = answer.value
  #     replies_list << reply
  #     question = answer.question.title
  #     questions_list << question
  #   end
  #   # use chatgpt > give it the question & answer and ask for sentiment
  #   content = "
  #   Based on these questions: #{questions_list} and these answers: #{replies_list}, give me your opinions on the sentiments of the answers and return an array of floats from 0 - 10,
  #   (with 0 being the most negative and 10 being the most positive). The array of questions is related to their array of answers based on their index.
  #   Format your answer in an array of floats, showing just the sentiment value of the answers. nothing else"
  #   client = OpenAI::Client.new(access_token: ENV['OPENAI_TOKEN'])
  #   response = client.chat(
  #     parameters: {
  #       temperature: 1.0,
  #       model: 'gpt-3.5-turbo',
  #       messages: [
  #         { role: 'user',
  #           content: content
  #         }
  #       ]
  #     }
  #   )
  #   reply = response.dig('choices', 0, 'message', 'content')
  #   puts reply
  #   # return float
  #   # attribute value to answers > sentiment_value
  #   answers.each_with_index do |answer, index|
  #     next if answer.blank?

  #     single_answer = Answer.find_by(value: answer)
  #     single_answer&.update(sentiment_value: reply[index] || 0.0)
  #   end
  # end

  private

  def form_params
    params.require(:form).permit(:title)
  end
end
