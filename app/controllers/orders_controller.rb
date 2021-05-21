class OrdersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @sum_price = 0
    @item_number = 1
    @orders = Order.find_by(id: params[:id])
    @shipment_status = OrderDetail.find_by(id: params[:id]).shipment_status.shipment_status_name
  end
end
