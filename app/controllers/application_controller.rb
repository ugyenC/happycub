class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user
  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:fname, :lname, :date_of_birth, :is_female,:email, :password,:avatar)}
      devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:fname, :lname, :date_of_birth, :is_female,:email, :password, :current_password,:avatar)}
  end




end
