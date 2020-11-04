class SessionController < ApplicationController
  skip_before_action :authorized, only: %i[new create services]
  skip_before_filter :verify_authenticity_token, :only => :create

  def new
  end

  def login; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.@user.authenticatable_salt
      session[:user_id] = @user.id
      redirect_to '/services'
    else
      redirect_to '/sign_in'
    end 
  end

  def page_requires_login; end
end