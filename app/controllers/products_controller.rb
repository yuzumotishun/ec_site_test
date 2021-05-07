class ProductsController < ApplicationController
  def show
    if !Product.exists?(params[:id])
      render products_not_find_path
    end
  end
end
