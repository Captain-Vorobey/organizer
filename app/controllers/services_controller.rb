class ServicesController < ApplicationController
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
  end

  def show
    @service ||= Service.find(params[:id])
  end

  before_action :show, :search

  def search
    query = params[:search_services].presence && params[:search_services][:query]

    @services = Service.search(query) if query
  end
end
