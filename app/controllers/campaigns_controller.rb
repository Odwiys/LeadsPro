class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[show]

  def index
    @campaigns = Campaign.all

    @campaigns = @campaigns.where("title ILIKE ?", "%#{params[:query]}%") if params[:query].present?

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "campaigns/show", locals: { campaigns: @campaigns }, formats: [:html] }
    end
  end

  def new
    @campaign = Campaign.new(params[:id])
    @campaign.user = current_user
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user

    if @campaign.save
      redirect_to new_campaign_form_path(@campaign)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_campaign
    @campaign = campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :start_date, :end_date, :details)
  end
end
