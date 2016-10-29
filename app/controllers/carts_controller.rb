class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
  end

  def add
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:product_id])
    @cart.products << @product
  end
end
