class ApplicationController < ActionController::Base
   before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    @user1 = current_user
    user_path(@user1)
  end

  def after_sign_out_path_for(resource)
    homes_about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:introduction])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :introduction])
  end


end
