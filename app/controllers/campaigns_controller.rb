class CampaignsController < ApplicationController
	before_action :set_campaign, only: %i[show]

	def index
	  @campaigns = Campaign.all
	end
  
	def new
	  @campaign = Campaign.new(params[:id])
	  @campaign.user = current_user
	end
  
	def create
	  @campaign = Campaign.new(campaign_params)
	  @campaign.user = current_user
	  if @campaign.save
		redirect_to campaigns_path
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
  