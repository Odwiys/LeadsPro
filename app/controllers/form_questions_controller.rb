class FormQuestionsController < ApplicationController
  def create
    @form_question = FormQuestion.new
    @question = Question.find(params[:question_id])
    @form = Form.find(params[:form_id])
    @form_question.question = @question
    @form_question.form = @form
    if @form_question.save
      redirect_to @form
    else
      render :create, status: :unprocessable_entity
    end
  end
end
