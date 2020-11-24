class CompanyController < ApplicationController
  before_action :index, :search, only: [:show, :edit, :delete, :update]

  def index
    @company ||= Company.find(params[:id])
    @services = @company.service
  end
end