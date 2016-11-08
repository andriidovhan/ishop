# Preview all emails at http://localhost:3000/rails/mailers/cart_mailer
class CartMailerPreview < ActionMailer::Preview
  def product_added
    CartMailer.product_added(Product.first)
  end

  def order_send
    @cart = Cart.find(22)
    @products = @cart.products.inspect
    @email = "test@preview.com"
    CartMailer.order_send(@products, @email)
  end
end
