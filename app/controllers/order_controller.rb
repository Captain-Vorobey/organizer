class OrderController < ApplicationController
  def show
  end
  
  def new
  end   
  
  def create
    @name = params[:new][:name]
    @order = Order.create(name: @name, service: Service.find(params[:id]), user: User.find(params[:id]))
  end
end
