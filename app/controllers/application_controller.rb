class ApplicationController < ActionController::Base
    before_action:authenticate_user!
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
end
