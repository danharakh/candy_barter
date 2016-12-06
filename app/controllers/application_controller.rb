class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:zipcode, :first_name, :last_name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:zipcode, :first_name, :last_name])
  end
end
