class TimeLimitsController < ApplicationController
  before_action :time_limit, only: %i[show edit update destroy]

  load_and_authorize_resource

  include Duration

  def index
    @time_limits = TimeLimit.all
  end

  def show; end

  def new
    @time_limit = TimeLimit.new
    @service = Service.find(params[:service_id])

    authorize! :new, TimeLimit do |_time_limit|
      @service.user_id == current_user.id
    end
  end

  def edit; end

  def create
    allowed_params = time_limit_params
    @time_limit = TimeLimit.new(allowed_params)
    @time_limit.user = current_user
    @time_limit.service_id = params[:service_id]

    respond_to do |format|
      if @time_limit.save
        format.html { redirect_to @time_limit, notice: 'Time limit was successfully created.' }
        format.json { render :show, status: :created, location: @time_limit }
      else
        format.html { render :new }
        format.json { render json: @time_limit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @time_limit.update(time_limit_params)
        format.html { redirect_to @time_limit, notice: 'Time limit was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_limit }
      else
        format.html { render :edit }
        format.json { render json: @time_limit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @time_limit.destroy
    respond_to do |format|
      format.html { redirect_to time_limits_url, notice: 'Time limit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def time_limit
    @time_limit = TimeLimit.find(params[:id])
  end

  def time_limit_params
    params.require(:time_limit).permit(:start_time, :end_time, :length, :service_id, :user_id)
  end
end
