class ServicesController < ApplicationController
  def show
    @service ||= Service.find(params[:id])
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
  end

  def search
    query = params[:search_services].presence && params[:search_services][:query]

    @services = Service.search(query) if query
  end
end
