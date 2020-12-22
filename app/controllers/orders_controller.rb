class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, :set_order, only: [:show]

  include Orderable

  def index
    @orders = current_user.orders.all
  end

  def show; end

  def new
    @beginArray = get_begin_time
    @order = Order.new
    $duration = get_length
    @order.service = Service.find(params[:id])
  end

  def edit; end

  def create
    allowed_params = order_params
    @order = Order.new(allowed_params)
    @order.user_id = current_user.id

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

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to order_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_service
    @service ||= Service.find(set_order.service_id)
  end

  def set_time_limit
    @time_limit = TimeLimit.find(Service.find(params[:id]).time_limit_id)
  end

  def order_params
    params.require(:order).permit(:name, :start_time, :user_id, :service_id)
  end
end
