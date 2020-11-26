class CompanyController < ApplicationController
  def index
    @company ||= Company.find(params[:id])
    @services = @company.service
  end
end
