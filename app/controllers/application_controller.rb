class ApplicationController < ActionController::Base
  protect_from_forgery only: []

  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email phone_number cea_number])
  end
end
