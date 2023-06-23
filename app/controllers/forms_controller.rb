class FormsController < ApplicationController
  def new
    @form = Form.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @form = Form.new(form_params)
    @campaign = Campaign.find(params[:campaign_id])
    @form.campaign = @campaign
    @campaign.user = current_user
    if @form.save
      redirect_to edit_campaign_form_path(@campaign, @form)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lead = Lead.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  private

  def form_params
    params.require(:form).permit(:title)
  end
end
