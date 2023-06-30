class LeadsController < ApplicationController
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
    @lead = Lead.new
    @form = Form.find(params[:form_id])
  end

  def create
    @form = Form.find(params[:form_id])
    @lead = Lead.new(leads_params)

    if @lead.save
      @response = Response.create(form: @form, lead: @lead)
      client = Vonage::Client.new(
        api_key: ENV['VONYAGE_KEY'],
        api_secret: ENV['VONYAGE_SECRET']
      )
      client.sms.send(
        from: "Vonage APIs",
        to: "6591295101",
        text: 'A new lead has just been validated'
      )
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

  def set_leads
    @lead = Lead.find(params[:id])
  end

  def leads_params
    params.require(:lead).permit(:name, :email, :phone_number)
  end
end
