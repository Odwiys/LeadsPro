class AnswersController < ApplicationController
  def new
    @response = Response.find(params[:response_id])
    @form = @response.form
    @answers = []

    @form.questions.each do |question|
      @answers << Answer.new(question_id: question.id, response_id: @response.id)
    end
  end

  def create
    @answer = Answer.find(params[:id])
  end

  def attempt
    @response = Response.find(params[:response_id])
    @answers = []
  end

  def answer_params
    params.require(:answer).permit(answers_attributes: %i[response_id question_id value])
  end
end
