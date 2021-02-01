class CompaniesController < ApplicationController
  before_action :company, only: %i[show edit destroy]

  def show
    @company = Company.find(params[:id])
    @services = @company.services
  end

  def new
    @company = Company.new
    authorize! :new, Company
  end

  def create
    allowed_params = company_params
    company = Company.new(allowed_params)
    company.user_id = params[:user_id]

    respond_to do |format|
      if company.save
        format.html do
          redirect_to "/users/#{current_user.id}/companies/#{company.id}", notice: 'company was successfully created.'
        end
        format.json { render :show, status: :created, location: company }
      else
        format.json { render json: company.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render layout: false }
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :avatar, :user_id)
  end

  def company
    @company = Company.find(params[:id])
  end

  def get_comments
    @comments = @company.comments
  end
end
