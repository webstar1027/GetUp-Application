class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      # Permit the `subscribe_newsletter` parameter along with the other
      # sign up parameters.
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || dashboard_path
    end
    
    def user_admin!
      if current_user.role == "super_admin"
         return true
      else
        redirect_to root_url, :notice => "You are not super admin!"
      end
    end
    
end

