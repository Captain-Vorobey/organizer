class HomeController < ApplicationController
  def index
    @services = Service.all
  end

  def about; end
end
