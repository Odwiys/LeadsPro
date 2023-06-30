class LeadsController < ApplicationController
  after_action :allow_iframe
  before_action :set_leads, only: %i[show]

  def index
    @leads = Campaign.find(params[:campaign_id]).leads.order(rating: :desc)

    @leads = @leads.where("title ILIKE ?", "%#{params[:query]}%") if params[:query].present?

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "leads/show", locals: { leads: @leads }, formats: [:html] }
    end
  end

  def new
    @campaign = Campaign.find_by(name: params[:campaign_name])
    @form = Form.find_by(title: params[:form_name], campaign: @campaign)
    @lead = Lead.new
  end

  def create
    @form = Form.find(params[:form_id])
    @lead = Lead.new(leads_params)

    if @lead.save
      @response = Response.create(form: @form, lead: @lead)

      redirect_to edit_response_path(@response)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def message

  end

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def set_leads
    @lead = Lead.find(params[:id])
  end

  def leads_params
    params.require(:lead).permit(:name, :email, :phone_number)
  end
end
