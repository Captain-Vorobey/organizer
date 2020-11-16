class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def login; end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    sign_in @user
    redirect_to 'home/index'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def page_requires_login; end
end
