class LeadsController < ApplicationController
  def create
    @response = Response.find(params[:response_id])
    @lead = Lead.new(lead_params) # except :rating

    if @lead.save
    else
    end

  end

  private

end
