class TimeslotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_timeslot, only: %i[show edit update destroy]

  # GET /timeslots
  # GET /timeslots.json
  def index
    @timeslots = current_user.timeslots.all
  end

  # GET /timeslots/1
  # GET /timeslots/1.json
  def show; end

  # GET /timeslots/new
  def new
    @timeslot = Timeslot.new
  end

  # GET /timeslots/1/edit
  def edit; end

  # POST /timeslots
  # POST /timeslots.json
  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.user_id = current_user.id
    respond_to do |format|
      if @timeslot.save
        format.html { redirect_to @timeslot, notice: 'Timeslot was successfully created.' }
        format.json { render :show, status: :created, location: @timeslot }
      else
        format.html { render :new }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeslots/1
  # PATCH/PUT /timeslots/1.json
  def update
    respond_to do |format|
      if @timeslot.update(timeslot_params)
        format.html { redirect_to @timeslot, notice: 'Timeslot was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeslot }
      else
        format.html { render :edit }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeslots/1
  # DELETE /timeslots/1.json
  def destroy
    @timeslot.destroy
    respond_to do |format|
      format.html { redirect_to timeslots_url, notice: 'Timeslot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_timeslot
    @timeslot = Timeslot.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def timeslot_params
    params.require(:timeslot).permit(:name, :start_time, :end_time, :user_id)
  end
end
