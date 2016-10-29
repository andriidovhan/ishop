class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
    @products = @cart.products
  end

  def add
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:product_id])
    @cart.products << @product
  end

  def delete
    @cart = Cart.find(session[:cart_id])
    @product = @cart.products.find(params[:product_id]).destroy
  end
end
