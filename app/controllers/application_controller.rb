class ApplicationController < ActionController::Base
  before_action:authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def after_sign_in_path_for(resource)
    # Redirect regular users to their profile page
    about_path
  end

  def after_sign_out_path_for(resource_or_scope)
    # Customize the redirect path after sign out
    # For example, redirect to the home page
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name])
  end

end
