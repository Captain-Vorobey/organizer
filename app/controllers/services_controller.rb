class ServicesController < ApplicationController
    before_action :show, :search, only: [:show, :edit, :delete, :update]

  def show
    @service ||= Service.find(params[:id])
  end

  def search
    query = params[:search_services].presence && params[:search_services][:query]
  
    if query
      @services = Service.search(query)
    end
  end
end