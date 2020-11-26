class BasketController < ApplicationController
  def show
    @orders = Order.all
  end
end
