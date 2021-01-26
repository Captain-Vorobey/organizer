class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  include Duration

  def index
    @orders = current_user.orders.all
  end

  def show
    @length = @order.service.time_limit.length * 60
  end

  def new
    @order = Order.new
    @time_arr = order_slots
  end

  def create
    allowed_params = order_params
    @order = Order.new(allowed_params)
    @order.user = current_user
    @order = start_time_validate(@order)

    OrderMailer.order_email(current_user).deliver_now

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

  def destroy
    set_order.destroy
    OrderMailer.destroy_order(current_user).deliver_now

    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def time_limit
    @time_limit ||= Service.find(params[:id]).time_limit
  end

  def order_params
    params.require(:order).permit(:name, :start_time, :user_id, :service_id)
  end
end
