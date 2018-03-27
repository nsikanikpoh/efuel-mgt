class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?
  #skip_before_action :authenticate_admin!, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :last_name, :avarta, :title, :sex, :phone, :type, :address, :info, :category_id, :catlevel1_id, :catlevel2_id, :catlevel3_id, :city, :state, :email, :password, :remember_me)}
  devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password, :remember_me)}
	devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:first_name, :last_name, :avarta, :title, :sex, :phone, :type, :address, :info, :category_id, :catlevel1_id, :catlevel2_id, :catlevel3_id, :city, :state, :email, :password, :current_password, :remember_me)}
  end
  
 # rescue_from CanCan::AccessDenied do |exception|
#    redirect_to main_app.root_path, :alert => exception.message
#  end

  
end
