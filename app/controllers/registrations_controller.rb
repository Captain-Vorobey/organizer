class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    super
    UserMailer.welcome_email(@user).deliver_now 
    resource.add_role(params[:user][:roles])
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [roles: []])
  end
end
