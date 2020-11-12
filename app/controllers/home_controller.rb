class HomeController < ApplicationController
  def index
    @services = Service.all.to_a
  end
end
