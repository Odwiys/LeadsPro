class LeadsController < ApplicationController
	before_action :set_leads, only: %i[show]

	def index
	  @leads = Lead.all

	  if params[:query].present?
		@leadss = @leads.where("title ILIKE ?", "%#{params[:query]}%")
	  end
  
	  respond_to do |format|
		format.html # Follow regular flow of Rails
		format.text { render partial: "leadss/show", locals: {leadss: @leadss}, formats: [:html] }
	  end
	end
  
	def new
	  @leads = leads.new(params[:id])
	  @leads.user = current_user
	end
  
	def create
	  @leads = leads.new(leads_params)
	  @leads.user = current_user
	  if @leads.save
		redirect_to leadss_path
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
	  params.require(:leads).permit(:name, :start_date, :end_date, :details)
	end
  end
  
