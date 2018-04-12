class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
 before_action :configure_devise_params, if: :devise_controller?

 def configure_devise_params
   devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:email, :password, :password_confirmation, :username, :sign_up_code) }
 end
end
