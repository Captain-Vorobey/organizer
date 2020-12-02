class OrderController < ApplicationController
  def show; end

  def new; end

  def create
    @order = Order.create(name: order_params[:order][:name], service: Service.find(order_params[:id]), user: User.find(current_user.id))
  end

  private

  def order_params
    params.permit(:id, order: {})
  end
end
