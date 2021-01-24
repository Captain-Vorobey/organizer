class HomeController < ApplicationController
  def index
    @services = Service.page params[:page]
  end

  def about; end
end
