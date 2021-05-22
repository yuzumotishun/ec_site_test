class OrdersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @sum_price = 0
    @order = Order.find_by(id: params[:id])
  end
end
