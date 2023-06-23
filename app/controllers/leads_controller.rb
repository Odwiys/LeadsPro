class LeadsController < ApplicationController
  #   def create
  #     @response = Response.find(params[:response_id])
  #     @lead = Lead.new(lead_params) # except :rating

  #     if @lead.save
  #     else
  #   end

  before_action :set_leads, only: %i[show]

  def index
    @leads = Lead.all

    @leadss = @leads.where("title ILIKE ?", "%#{params[:query]}%") if params[:query].present?

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "leadss/show", locals: { leadss: @leadss }, formats: [:html] }
    end
  end

  def new
    @leads = leads.new(params[:id])
    @leads.user = current_user
  end

  def create
    @lead = Lead.new(leads_params)
    @response = Response.find(params[:response_id])
    @lead.response = @response
    @form = Form.find(params[:form_id])
    @response.form = @form
    @campaign = Campaign.find(params[:campaign_id])
    @form.campaign = @campaign
    @campaign.user = current_user

    if @leads.save
      redirect_to leads_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_leads
    @leads = leads.find(params[:id])
  end

  def leads_params
    params.require(:leads).permit(:name, :email, :phone_number)
  end
end
