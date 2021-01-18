class ServicesController < ApplicationController
  before_action :set_service, only: %i[show destroy]

  def show
    @user = current_user
    @company = Company.find(set_service.company_id)
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render layout: false}
    end 
  end

  def new
    @service = Service.new
    authorize! :new, Service
  end

  def create
    allowed_params = service_params
    @service = Service.new(allowed_params)
    @service.user_id = current_user.id

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

  def search
    query = params[:search_services].presence && params[:search_services][:query]

    @services = Service.search(query) if query
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :company_id, :user_id)
  end
end
