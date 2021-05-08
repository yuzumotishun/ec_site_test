class ProductsController < ApplicationController
  def show
    @product_find_check = Product.find_by(id: params[:id])
    @product = Product.find(params[:id])

    ### header 統一化後、削除して良い
    @user = User.find(params[:id])
  end
end
