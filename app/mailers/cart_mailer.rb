class CartMailer < ApplicationMailer
  def product_added(product)
    @product = product
    mail(to: 'veseluj_@ukr.net',
         subject: 'Product has just been added')
  end

  def order_send(products, email)
    @products = products
    @email = email
    mail(to: "#{@email}",
         subject: "Your order:")
  end
end