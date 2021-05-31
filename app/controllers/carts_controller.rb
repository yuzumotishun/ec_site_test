class CartsController < ApplicationController
  def show
    @cart = []
    session[:cart].each do |cart|
      product = Product.find(cart["product_id"])
      sub_total = product.price * cart["quantity"]
      @cart.push([product.product_name, product.category.category_name, product.price, cart["quantity"].to_i, sub_total])
    end
  end

  def add_cart
    if session[:cart].blank? #session内の商品の有無で条件分岐
      #商品が入っていない場合
      session[:cart] = [{product_id: params[:product_id], quantity: params[:quantity].to_i}]
    else
      #商品が既に入っている場合、追加する商品が重複するかで条件分岐
      #####未解決#####
      # if session[:cart]{"product_id"} == params[:product_id] #重複が発生する場合

      #   #false => session[:cart]{"product_id"} == params[:product_id]
      #   #エラー => session[:cart]["product_id"]
      #   #エラー => session[:cart][{"product_id"=>"1"]
      #   #エラー => session[:cart][{"product_id"}]

      #   session[:cart].map{|cart|
      #   cart[:quantity] += params[:quantity].to_i
      #   }
      ################
      else #重複が発生しない場合
        session[:cart].push({ product_id: params[:product_id], quantity: params[:quantity].to_i })
      end
    end
    redirect_to carts_show_path_url
  end
#####未解決#####
  #数量変更
  # def change_quantity
  #   変更元 = params[:quantity]
  # end

  #商品削除
  # def destroy_carts_item
  #   session[:cart].delete_at(session[:cart].find_index(params["delete_number".to_i]))
  # end
################
end