class FormsController < ApplicationController
  def new
    @form = Form.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @form = Form.new(form_params)
    @campaign = Campaign.find(params[:campaign_id])
    @question = Question.new
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

  private

  def form_params
    params.require(:form).permit(:title)
  end
end
