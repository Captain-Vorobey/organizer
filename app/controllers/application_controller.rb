class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    user_path(current_user.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, roles: []) }
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  private

  def set_time_zone
    Time.zone = current_user.time_zone
  end
end
