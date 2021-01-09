class CompaniesController < ApplicationController
  def show
    @company ||= Company.find(params[:id])
    @services = @company.service
  end

  def create

  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :description)
  end
end
