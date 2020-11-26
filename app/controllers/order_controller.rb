class OrderController < ApplicationController
  before_action :set_order

  def create
    @order = @order.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
  end

  def destroy
    @order = Order.find(params[:id]) 
    @order_item.destroy
  end

  private

  def order_params
    params.require(:order).permit(:service_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
