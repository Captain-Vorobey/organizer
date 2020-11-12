class SessionsController < ApplicationController

  def new; end

  def login; end

  def create; end

  def page_requires_login; end

  def destroy
    sign_out
    redirect_to root_url
  end
end
