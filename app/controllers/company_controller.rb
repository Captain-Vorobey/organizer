class CompanyController < ApplicationController
  def index
    @company = Company.first
  end
end
