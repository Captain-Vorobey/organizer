class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @services = @company.service
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render layout: false }
    end
  end

  def new
    @company = Company.new
    authorize! :new, Company
  end

  def create
    allowed_params = company_params
    company = Company.new(allowed_params)

    respond_to do |format|
      if company.save
        format.html { redirect_to "/users/#{current_user.id}/companies/#{company.id}", notice: 'company was successfully created.' }
        format.json { render :show, status: :created, location: company }
      else
        format.json { render json: company.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :user_id)
  end
end
