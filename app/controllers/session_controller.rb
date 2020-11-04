class SessionController < ApplicationController
  def new
  end

  def login; end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticatable_salt
      session[:user_id] = @user.id
      redirect_to '/services'
    else
      redirect_to '/sign_in'
    end 
  end

  def page_requires_login; end
end