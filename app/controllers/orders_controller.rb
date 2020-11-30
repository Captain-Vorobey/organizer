class OrdersController < ApplicationController
  def show
  end
  
  def new
    @order = Order.new
  end   
  
  def create
    @order = Order.new
    p @orders = Order.all
  end
end
