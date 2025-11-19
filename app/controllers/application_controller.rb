class ApplicationController < ActionController::Base
  # Require login everywhere by default
  before_action :authenticate_user!

  # Tell Devise to allow extra params
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Extra params for sign up / account update
  def configure_permitted_parameters
    # For app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:language_level, :first_name, :last_name])

    # For app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:language_level, :first_name, :last_name])
  end
end
