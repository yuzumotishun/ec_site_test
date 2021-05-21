class OrdersController < ApplicationController
  def show
    @sum_price = 0
    @orders = Order.find_by(id: params[:id])
    @shipment_status = OrderDetail.find_by(id: params[:id]).shipment_status.shipment_status_name
  end
end
