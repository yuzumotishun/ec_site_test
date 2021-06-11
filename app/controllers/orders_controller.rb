class OrdersController < ApplicationController
  before_action :correct_users_order, only: [:show]

  def show
    @order = Order.find_by(id: params[:id])
  end

  #### TODO:カートに商品が入ってる状態で当該商品を消し、カートに入っている商品すべて存在しないものにしてから注文ボタンを押すした際に中身のないOrderが作成されることを防ぐ ####
  # カート内商品情報を保存する
  def create
    if session[:cart].blank?
      return redirect_to carts_show_path
    end

    complex_data = "#{current_user.id}#{Time.current.to_i}"
    order = current_user.orders.create!(
      order_date: Time.current,
      order_number: complex_data.rjust(16, "0"),
    )
    session[:cart].each do |cart|
      order.order_details.create(
        product_id: cart["product_id"],
        shipment_status_id: 1,
        order_detail_number: "#{cart["product_id"]}#{complex_data}".rjust(16, "0"),
        order_quantity: cart["quantity"],
      )
    end
    session[:cart].clear
    redirect_to perchase_completed_path(order.id)
  end

  def perchase_completed
    @display_number = Order.find_by(id: params[:id]).order_number
  end

  def correct_users_order
    unless current_user.id == Order.find(params[:id]).user_id
      flash[:danger] = "他人の情報にアクセスすることはできません。"
      redirect_to root_path
    end
  end
end
