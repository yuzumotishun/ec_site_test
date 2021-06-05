class OrdersController < ApplicationController
  before_action :correct_user, only: [:show]
  include SessionsHelper

  def show
    @order = Order.find_by(id: params[:id])
  end

  # カート内商品情報を保存する
  def create
    order = current_user.orders.create(
      order_date: Time.current,
      order_number: ("%016d" % (current_user.id + Time.current.to_i)),
    )
    session[:cart].each do |cart|
      order.order_details.create(
        product_id: cart["product_id"],
        shipment_status_id: 1,
        order_detail_number: (current_user.id + cart["product_id"].to_i + Time.current.to_i),
        order_quantity: cart["quantity"],
      )
    end
    session[:cart].clear
    redirect_to perchase_completed_path
  end

  # ユーザーの最新のorderデータを抽出し、注文番号を反映する
  def perchase_completed
    latest_order = Order.where(:user_id == current_user.id).last
    @display_number = latest_order.order_number
  end
end
