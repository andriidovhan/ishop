class ProductsController < ApplicationController
  def index
    @products = Product.all

    # render '/products/lol'
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  private
  def product_params
    params.require('product').permit('name', 'price', 'description')
  end
end


# around_action :clear_cache, only: :new
# def clear_cache
#   prepare_smth
#
#   yield
#
#   clear_cache
# end