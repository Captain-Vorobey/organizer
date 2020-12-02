class OrderController < ApplicationController
  def show; end

  def new; end

  def create
    service = Service.find(params[id])
    allowed_params = order_params.merge(service: service, user: current_user)
    @order = Order.create(allowed_params)
  end

  private

  def order_params
    params.require(:order).permit(:name)
  end
end
