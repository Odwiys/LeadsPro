class ResponsesController < ApplicationController
  def edit
    @response = Response.find(params[:id])
    @response.form.questions.each do |question|
      @response.answers.build(question_id: question.id) unless @response.answers.any? {|ans| ans.question == question}
    end
  end

  def create
    @response = Response.find(params[:id])
  end

  def update
    @response = Response.find(params[:id])
    form = @response.form
    successful_saves = []
    response_params[:answers_attributes].each do |_, ans_attribute|
      answer = Answer.find_or_create_by(
        question_id: ans_attribute[:question_id],
        response_id: params[:id]
      )

      answer.value = ans_attribute[:value]
      successful_saves << answer.save
    end

    if successful_saves.length == form.questions.length && successful_saves.all?
      answers = @response.answers
      AnalyzeSentiments.call(answers)
      lead = @response.lead
      CalculateLeadRating.(lead)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def response_params
    params.require(:response).permit(answers_attributes: [:question_id, :value])
  end
end
