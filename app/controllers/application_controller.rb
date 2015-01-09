class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_event
  before_action :configure_permited_params, if: :devise_controller?

protected
	def set_event 
		@event_main = Event.first
	end

	def configure_permited_params
		news_attrs = [:name, :role_id]
		devise_parameter_sanitizer.for(:sign_up) << :name
		devise_parameter_sanitizer.for(:account_update) << news_attrs 
	end
end
