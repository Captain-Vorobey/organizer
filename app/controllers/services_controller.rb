class ServicesController < ApplicationController
    before_action :set_service, only: [:show, :edit, :delete, :update]

  def show; end

  private

  def set_service
    @service ||= Service.find(params[:id])
  end
end