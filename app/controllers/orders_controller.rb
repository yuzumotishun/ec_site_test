class OrdersController < ApplicationController
  def show
    @order = OrderDetail.find_by(id: params[:id])
    @orders = OrderDetail.all
  end
end
