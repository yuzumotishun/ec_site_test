class ProductsController < ApplicationController
  def show
    unless Product.exists?(params[:id])
      render products_not_find_path
    end
  end
end
