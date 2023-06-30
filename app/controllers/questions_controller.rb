class QuestionsController < ApplicationController
  before_action :set_form, only: %i[new create]

  def new
    @question = Question.new
  end

  def create
    @form_question = FormQuestion.new
    @question = Question.new(question_params)
    @form_question.question = @question
    @form_question.form = @form

    if @question.save && @form_question.save
      redirect_to edit_campaign_form_path(@form.campaign_id, @form), notice: 'Question created successfully.'
    else

      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_form
    @form = Form.find(params[:form_id])
  end

  def question_params
    params.require(:question).permit(:title, :format, options_attributes: %i[value sentiment_value])
  end
end
