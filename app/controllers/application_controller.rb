class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # redirect to dog page after sign in
  def after_sign_in_path_for(resource)
    if session[:dog_id].present?
      dog_path(session[:dog_id])
    else
      root_path
    end
  end

  protected

  # add username to devise standard setup
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
