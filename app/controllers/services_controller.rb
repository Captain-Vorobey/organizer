class ServicesController < ApplicationController
  before_action :set_service, only: %i[show destroy]

  def show
    @user = current_user
    @company = Company.find(@service.company_id)
  end

  def destroy
    @service.destroy
  end

  def new
    @service = Service.new
  end

  def create
    allowed_params = service_params
    @service = Service.new(allowed_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'company was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, location: @service }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :company_id)
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def search
    query = params[:search_services].presence && params[:search_services][:query]

    @services = Service.search(query) if query
  end
end
