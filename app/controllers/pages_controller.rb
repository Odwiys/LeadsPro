class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
    @x_values = ['January','February','March','April','May','June']
    @y_values = [35, 25, 38, 41, 54, 62]
  end
end
