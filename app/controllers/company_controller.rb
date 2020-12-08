class CompanyController < ApplicationController

  def index
    @company = set_company
    @services = @company.service
  end

  def set_company
    @company ||= Company.find(params[:company_id])
  end
end
