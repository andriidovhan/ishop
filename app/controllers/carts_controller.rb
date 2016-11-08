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

  def order_send
    @cart = Cart.find(session[:cart_id])
    @products = @cart.products
    @email = params[:email]
    CartMailer.order_send(@products, @email).deliver_now
    redirect_to products_path, alert: 'Order has been sent to your Email and your cart has been cleaned'
    @cart.products.delete_all
  end

end
