class SessionController < ApplicationController
  skip_before_action :authorized, only: %i[new create services]
  skip_before_filter :verify_authenticity_token, only: :create

  def new; end

  def login; end

  def create; end

  def page_requires_login; end
end
