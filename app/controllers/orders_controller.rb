class OrdersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @sum_price = 0
    @order = Order.find_by(id: params[:id])
    shipment_statuses
  end

  private
   def shipment_statuses
    @shipment_statuses =
    @order.order_details.map do |order_detail|
      order_detail.shipment_status.shipment_status_name
    end
   end
end
