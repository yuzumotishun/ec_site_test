class OrdersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @order = Order.find_by(id: params[:id])
  end

  def perchase_completed
    #### TODO: 注文番号を生成する処理を書く ####%
  end
end
