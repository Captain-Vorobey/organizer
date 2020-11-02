class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]
  def new; end

  def login; end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticatable_salt
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end 
  end

  def page_requires_login; end
end
