
class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
 before_filter :configure_permitted_parameters, if: :devise_controller?
 
 include Pundit

 after_action :verify_authorized, unless: :devise_controller?
 before_filter :set_global_search_variable

	 def set_global_search_variable
	   @q = Sample.search(params[:q])
	 end
	
protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:account_update) << :name
 end
end

