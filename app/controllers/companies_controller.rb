class CompaniesController < ApplicationController
  def show
    @company ||= Company.find(params[:id])
    @user = current_user
    @services = @company.service
  end

  def destroy
    @company.destroy
  end

  def new
    @company = Company.new
  end

  def create
    allowed_params = company_params
    @company = Company.new(allowed_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, location: @company }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :description)
  end
end
