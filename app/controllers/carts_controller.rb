class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
    @products = @cart.products
  end

  def add
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:product_id])
    @cart.products << @product
    # CartMailer.product_added(@product).deliver_now
  end

  def destroy
    cart = Cart.find(session[:cart_id])
    product = cart.products.find(params[:id])
    cart.products.delete product
    redirect_to carts_show_path, alert: 'Product has been successfully removed from cart.'
  end
end
