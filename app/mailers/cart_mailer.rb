class CartMailer < ApplicationMailer
  def product_added(product)
    @product = product
    mail(to: 'veseluj_@ukr.net',
         subject: 'Product has just been added')
  end
end
