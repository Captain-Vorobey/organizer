class ServicesController < ApplicationController
  before_action :set_service, :set_order, only: [:show, :destroy]
  
  def show; end

  def destroy
    @service.destroy
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def search
    query = params[:search_services].presence && params[:search_services][:query]

    @services = Service.search(query) if query
  end
end
