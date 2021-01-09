class ServicesController < ApplicationController
  before_action :set_service, only: %i[show destroy]

  def show; end

  def destroy
    @service.destroy
  end

  def create 
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def search
    query = params[:search_services].presence && params[:search_services][:query]

    @services = Service.search(query) if query
  end
end
