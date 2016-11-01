# Preview all emails at http://localhost:3000/rails/mailers/cart_mailer
class CartMailerPreview < ActionMailer::Preview
  def product_added
    CartMailer.product_added(Product.first)
  end
end
