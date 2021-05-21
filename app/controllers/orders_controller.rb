class OrdersController < ApplicationController
  def show
    @sum_price = 0
    @orders = Order.find_by(id: params[:id])
  end
end
