class CartsController < ApplicationController
  def show
    @cart = []
    session[:cart].each do |cart|
      product = Product.find_by(id: cart["product_id"])
      sub_total = product.price * cart["quantity"]
      if product
        @cart.push([product.product_name, product.category.category_name, product.price, cart["quantity"].to_i, sub_total])
      end
    end
    @cart_total_price = cart_total_price(@cart)
  end

  def add_cart
    # session内の商品の有無で条件分岐
    if session[:cart].blank?
      # 商品が入っていない場合
      session[:cart] = [{ product_id: params["product_id"], quantity: params["quantity"].to_i }]
      redirect_to carts_show_path
      return
    end
    # 商品が既に入っている場合、追加する商品が重複するかで条件分岐
    match = session[:cart].select {|cart| cart["product_id"] == params["product_id"] }
    # 重複が発生する場合
    if match.present?
      match[0]["quantity"] += params["quantity"].to_i
    # 重複が発生しない場合
    else
      session[:cart].push({ product_id: params["product_id"], quantity: params["quantity"].to_i })
    end
    redirect_to carts_show_path
  end

  # カート内商品の数量変更
  def change_quantity
    index = params["index"].to_i - 1
    session[:cart][index]["quantity"] = params[:quantity].to_i
    redirect_to carts_show_path
  end

  # カート内商品の削除
  def destroy_carts_item
    index = params["index"].to_i - 1
    session[:cart].delete_at(index)
    redirect_to carts_show_path
  end

  # カート内商品の合計金額の計算
  def cart_total_price(cart)
    cart.sum {|i| i[4] }
  end
end
