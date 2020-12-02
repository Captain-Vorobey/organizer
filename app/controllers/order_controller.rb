class OrderController < ApplicationController
  def new; end

  def create
    service = Service.find(params[:service_id])
    allowed_params = order_params.merge(service: service, user: current_user)
    @order = Order.create(allowed_params)
  end

  private

  def order_params
    params.require(:order).permit(:name)
  end
end
