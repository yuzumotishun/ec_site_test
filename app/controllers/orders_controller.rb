class OrdersController < ApplicationController
  before_action :correct_users_order, only: [:show]

  def show
    @order = Order.find_by(id: params[:id])
  end

  def correct_users_order
    
    binding.pry
    
    unless current_user.id == Order.find(params[:id]).user_id
      flash[:danger] = "他人の情報にアクセスすることはできません。"
      redirect_to root_path
    end
  end
end
