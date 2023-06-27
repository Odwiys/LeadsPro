class QuestionsController < ApplicationController
  before_action :set_form, only: %i[new create]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.form = @form
    @campaign.user = current_user
    if @question.save
      redirect_to @form, notice: 'Question created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_form
    @form = Form.find(params[:form_id])
  end

  def question_params
    params.require(:question).permit(:title, :format)
  end
end
