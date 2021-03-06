class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]
  load_and_authorize_resource only: %i[new destroy edit update]

  include ServicesHelper

  def show
    @user = current_user
    @company = Company.find(set_service.company_id)
  end

  def new
    @service = Service.new
    @user_companies = current_user_companies
  end

  def create
    allowed_params = service_params
    @service = Service.new(allowed_params)
    @service.user_id = current_user.id

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, location: @service }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render layout: false }
    end
  end

  def edit
    @user_companies = current_user_companies
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
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
    params.require(:service).permit(:name, :description, :avatar, :company_id, :user_id)
  end

  def get_comments
    @comments = @service.comments
  end
end
