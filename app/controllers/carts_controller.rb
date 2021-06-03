class CartsController < ApplicationController
  def show
    @cart = []
    session[:cart].each do |cart|
      product = Product.find(cart["product_id"])
      sub_total = product.price * cart["quantity"]
      @cart.push([product.product_name, product.category.category_name, product.price, cart["quantity"].to_i, sub_total])
    end
  end
#########途中#########
  def add_cart
    #session内の商品の有無で条件分岐
    if session[:cart].blank? 
      #商品が入っていない場合
      session[:cart] = [{product_id: params["product_id"], quantity: params["quantity"].to_i}]
      return
    end
    #商品が既に入っている場合、追加する商品が重複するかで条件分岐
    
    match = session[:cart].select{|cart|cart["product_id"] == params["product_id"]}
    #重複が発生する場合
    if match
      
      binding.pry
      
      match["quantity"] += params["quantity"].to_i
    #重複が発生しない場合
    else
      session[:cart].push({ product_id: params["product_id"], quantity: params["quantity"].to_i })
    end
    redirect_to carts_show_path
  end
  #########途中#########
    
    #  session[:cart].each do |cart|
    #   if cart["product_id"] != params["product_id"]  
    #     session[:cart].push({ product_id: params["product_id"], quantity: params["quantity"].to_i })
    #   end
    # end
      #session[:cart].select{|cart|cart["product_id"] != params["product_id"]}.push({ product_id: params["product_id"], quantity: params["quantity"].to_i })
      # if session[:cart].select{|cart|cart["product_id"] == params["product_id"]}
      #   session[:cart].map{|dup|dup["quantity"] += params["quantity"].to_i}
      # end
      # if session[:cart].select{|cart|cart["product_id"] != params["product_id"]}
      #   session[:cart].push({ product_id: params["product_id"], quantity: params["quantity"].to_i })
      # end
      ######
      # session[:cart].map{|cart|
      # if cart["product_id"] == params["product_id"]  
      #     cart["quantity"] += params["quantity"].to_i
      
      #   bbb = { product_id: params["product_id"], quantity: params["quantity"].to_i }
        
      #   binding.pry
        
      #     cart << bbb
      # end
      # }
      ######
    
      #if session[:cart][0..count].include?({"product_id"=>"#{input_id}"})
      # if session[:cart]["product_id"].include?(params[:product_id]) #重複が発生する場合
      

      #   #false => session[:cart]{"product_id"} == params[:product_id]
      #   #エラー => session[:cart]["product_id"]
      #   #エラー => session[:cart][{"product_id"=>"1"]
      #   #エラー => session[:cart][{"product_id"}]
      # params[:product_id] => "2"
      #  session[:cart][0]["product_id"] => "2"

      #   session[:cart].map{|cart|
      #   cart[:quantity] += params[:quantity].to_i
      #   }
      ################
  #数量変更
  def change_quantity
    index = (params["index"].to_i) - 1
    session[:cart][index]["quantity"] = params[:quantity].to_i
    redirect_to carts_show_path
  end

  #商品削除
  def destroy_carts_item
    index = (params["index"].to_i) - 1
    session[:cart].delete_at(index)
    redirect_to carts_show_path
  end
end

