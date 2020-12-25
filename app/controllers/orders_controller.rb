class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]
  

  include Orderable

  def index
    @orders = current_user.orders.all
  end

  def show
    @length = @order.service.time_limit.length * 60
  end

  def new
    @beginArray = get_begin_time
    @order = Order.new
    @order.user_id = current_user.id
    @order.service = Service.find(params[:id])
  end

  def create
    allowed_params = order_params
    @order = Order.new(allowed_params)
    @order = start_time_validate(@order)
    
    if @order.start_time == nil
      flash.alert = "This time is already taken for this service. Please choose a different time"
    else
      respond_to do |format|
        if @order.save
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new, location: @order }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    set_order.destroy
    flash.alert = 'Order was successfully destroyed.' 
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_service
    @service ||= set_order.service
  end

  def set_time_limit
    @time_limit = Service.find(params[:id]).time_limit
  end

  def order_params
    params.require(:order).permit(:name, :start_time, :user_id, :service_id)
  end
end