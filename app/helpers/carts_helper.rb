module CartsHelper
  def cart_partial
    @products.empty? ? 'empty' : 'lists'
  end
end